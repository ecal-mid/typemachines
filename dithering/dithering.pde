PImage img;
PShader ditheringShader;
PGraphics canvas;

void setup() {
  size(1000, 1000, P2D);
  img = loadImage("image.jpg");
  ditheringShader = loadShader("dithering-frag.glsl", "dithering-vert.glsl");
  canvas = createGraphics(width, height);
}

void draw() {
  // Render canvas
  canvas.beginDraw();
  canvas.image(img, 0, 0, width, height);
  canvas.endDraw();

  // Render dithered canvas
  ditheringShader.set("map", canvas);
  rect(0, 0, width, height);
  shader(ditheringShader);
}