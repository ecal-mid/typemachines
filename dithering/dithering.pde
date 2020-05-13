import processing.opengl.*;
import codeanticode.glgraphics.*;

PImage img;
PImage nearestTexture;
PShader ditheringShader;
PGraphics canvas;

int resX = 500;
int resY = 500;

void setup() {
  size(1000, 1000, P3D);
  img = loadImage("image.jpg");
  ditheringShader = loadShader("dithering-frag.glsl", "dithering-vert.glsl");
  canvas = createGraphics(resX, resY, P2D);
  nearestTexture = createImage(resX, resY, ARGB);

  hint(DISABLE_TEXTURE_MIPMAPS);
  ((PGraphicsOpenGL)g).textureSampling(2);
}

void draw() {
  canvas.beginDraw();
  ditheringShader.set("map", img);
  canvas.rect(0, 0, canvas.width, canvas.height);
  canvas.shader(ditheringShader);
  canvas.endDraw();
  canvas.loadPixels();

  nearestTexture.pixels = canvas.pixels;
  nearestTexture.updatePixels();

  image(nearestTexture, 0, 0, width, height);
}