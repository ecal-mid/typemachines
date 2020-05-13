import processing.opengl.*;
import codeanticode.glgraphics.*;

PImage img;
PShader ditheringShader;
PGraphics canvas;

void setup() {
  size(1000, 1000, P3D);
  img = loadImage("image.jpg");
  ditheringShader = loadShader("dithering-frag.glsl", "dithering-vert.glsl");
  canvas = createGraphics(200, 200, P2D);

  hint(DISABLE_TEXTURE_MIPMAPS);
  ((PGraphicsOpenGL)g).textureSampling(2);
}

void draw() {
  canvas.beginDraw();
  ditheringShader.set("map", img);
  canvas.rect(0, 0, canvas.width, canvas.height);
  canvas.shader(ditheringShader);
  canvas.endDraw();

  image(canvas, 0, 0, width, height);
}