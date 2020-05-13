PImage img;
boolean highq = true;

PGraphics canvas;
PShader shader;
PImage nearestTexture;

void setup() {
  size(500, 500, P3D);
  ((PGraphicsOpenGL)g).textureSampling(2);

  img = loadImage("img.png");
  shader = loadShader("test-frag.glsl", "test-vert.glsl");
  canvas = createGraphics(32, 32, P2D);
  nearestTexture = createImage(32, 32, ARGB);
}

void draw() {
  canvas.beginDraw();
  canvas.rect(0, 0, canvas.width, canvas.height);
  canvas.shader(shader);
  canvas.endDraw();
  canvas.loadPixels();
  nearestTexture.pixels = canvas.pixels;
  nearestTexture.updatePixels();

  background(0);
  image(nearestTexture, 0, 0, width, height);
}
