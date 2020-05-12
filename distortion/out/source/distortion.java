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

public class distortion extends PApplet {

PImage noise;

PGraphics normalMap;
PShader normalShader;

PGraphics map;
PGraphics distortedMap;
PShader distortShader;

public void setup() {
  

  noise = loadImage("noise.jpg");
  normalMap = createGraphics(500, height, P2D);
  normalShader = loadShader("normal-frag.glsl", "normal-vert.glsl");

  map = createGraphics(500, height);
  distortedMap = createGraphics(500, height, P2D);
  distortShader = loadShader("distort-frag.glsl", "distort-vert.glsl");

  
}

public void draw() {
  renderNormalMap();
  renderMap();
  renderDistortedMap();
  image(noise, 0, 0, 500, height);
  image(normalMap, 500, 0, 500, height);
  image(distortedMap, 1000, 0, 500, height);
}

public void renderNormalMap() {
  normalMap.beginDraw();
  normalMap.background(0);
  normalShader.set("offsetX", (PApplet.parseFloat(mouseX) - width * 0.5f) / (width * 0.5f));
  normalShader.set("offsetY", (PApplet.parseFloat(mouseY) - height * 0.5f) / (height * 0.5f));
  normalShader.set("noiseTexture", noise);
  normalMap.rect(0, 0, 500, height);
  normalMap.shader(normalShader);
  normalMap.endDraw();
}

public void renderMap() {
  map.beginDraw();
  map.background(0);
  map.textSize(200);
  map.textAlign(CENTER, CENTER);
  map.text("TEXT", 250, 210);
  map.fill(255);
  map.endDraw();
}

public void renderDistortedMap() {
  distortedMap.beginDraw();
  distortShader.set("map", map);
  distortShader.set("normalMap", normalMap);
  distortedMap.rect(0, 0, 500, height);
  distortedMap.shader(distortShader);
  distortedMap.endDraw();
}
  public void settings() {  size(1500, 500, P2D);  smooth(); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "distortion" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
