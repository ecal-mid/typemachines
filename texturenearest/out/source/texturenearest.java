import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class texturenearest extends PApplet {

PImage img;
boolean highq = true;

PGraphics canvas;
PShader shader;
PImage nearestTexture;

public void setup() {
  
  ((PGraphicsOpenGL)g).textureSampling(2);

  img = loadImage("img.png");
  shader = loadShader("test-frag.glsl", "test-vert.glsl");
  canvas = createGraphics(32, 32, P2D);
  nearestTexture = createImage(32, 32, ARGB);
}

public void draw() {
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
  public void settings() {  size(500, 500, P3D); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "texturenearest" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
