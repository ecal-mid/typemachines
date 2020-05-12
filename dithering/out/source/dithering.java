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

public class dithering extends PApplet {

PImage img;
PShader ditheringShader;
PGraphics canvas;

public void setup() {
  
  img = loadImage("image.jpg");
  ditheringShader = loadShader("dithering-frag.glsl", "dithering-vert.glsl");
  canvas = createGraphics(width, height);
}

public void draw() {
  // Render canvas
  canvas.beginDraw();
  canvas.image(img, 0, 0, width, height);
  canvas.endDraw();

  // Render dithered canvas
  ditheringShader.set("map", canvas);
  rect(0, 0, width, height);
  shader(ditheringShader);
}
  public void settings() {  size(1000, 1000, P2D); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "dithering" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
