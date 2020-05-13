PImage img;
PShader ditheringShader;

void setup() {
  size(1000, 1000, P3D);
  img = loadImage("image.jpg");
  ditheringShader = loadShader("dithering-frag.glsl", "dithering-vert.glsl");
  ortho(-width/2, width/2, -500, 500);
}

void draw() {
  ditheringShader.set("map", img);
  rect(0, 0, 100, 100);
  shader(ditheringShader);
}