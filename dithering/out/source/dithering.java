import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import processing.opengl.*; 
import codeanticode.glgraphics.*; 

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
  canvas = createGraphics(200, 200, P2D);

  hint(DISABLE_TEXTURE_MIPMAPS);
  ((PGraphicsOpenGL)g).textureSampling(2);
}

public void draw() {
  canvas.beginDraw();
  ditheringShader.set("map", img);
  canvas.rect(0, 0, canvas.width, canvas.height);
  canvas.shader(ditheringShader);
  canvas.endDraw();

  image(canvas, 0, 0, width, height);
}
  public void settings() {  size(1000, 1000, P3D); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "dithering" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
