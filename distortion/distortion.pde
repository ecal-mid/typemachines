PImage noise;

PGraphics normalMap;
PShader normalShader;

PGraphics map;
PGraphics distortedMap;
PShader distortShader;

void setup() {
  size(1500, 500, P2D);

  noise = loadImage("noise.jpg");
  normalMap = createGraphics(500, height, P2D);
  normalShader = loadShader("normal-frag.glsl", "normal-vert.glsl");

  map = createGraphics(500, height);
  distortedMap = createGraphics(500, height, P2D);
  distortShader = loadShader("distort-frag.glsl", "distort-vert.glsl");

  smooth();
}

void draw() {
  renderNormalMap();
  renderMap();
  renderDistortedMap();
  image(noise, 0, 0, 500, height);
  image(normalMap, 500, 0, 500, height);
  image(distortedMap, 1000, 0, 500, height);
}

void renderNormalMap() {
  normalMap.beginDraw();
  normalMap.background(0);
  normalShader.set("offsetX", (float(mouseX) - width * 0.5) / (width * 0.5));
  normalShader.set("offsetY", (float(mouseY) - height * 0.5) / (height * 0.5));
  normalShader.set("noiseTexture", noise);
  normalMap.rect(0, 0, 500, height);
  normalMap.shader(normalShader);
  normalMap.endDraw();
}

void renderMap() {
  map.beginDraw();
  map.background(0);
  map.textSize(200);
  map.textAlign(CENTER, CENTER);
  map.text("TEXT", 250, 210);
  map.fill(255);
  map.endDraw();
}

void renderDistortedMap() {
  distortedMap.beginDraw();
  distortShader.set("map", map);
  distortShader.set("normalMap", normalMap);
  distortedMap.rect(0, 0, 500, height);
  distortedMap.shader(distortShader);
  distortedMap.endDraw();
}