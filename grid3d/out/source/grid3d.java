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

public class grid3d extends PApplet {

int numX;
int numY;
PImage img;

public void setup() {
  
  numX = 10;
  numY = 10;
  img = loadImage("img.jpeg");
  rectMode(CENTER);
  imageMode(CENTER);
}

public void draw() {
  background(0);

  for (int j = 0; j < numY; j++) {
    for (int i = 0; i < numX; i++) {
      int stepX = width / numX;
      int stepY = height / numY;
      int x = stepX * i;
      int y = stepY * j;

      push();
      float varyingValue = sin(millis() * 0.001f + i * 0.2f + j * 0.2f);
      translate(x + stepX * 0.5f, y + stepY * 0.5f, varyingValue * 100);
      rotateY(varyingValue * 0.5f);

      int imageWidth = img.width / numX;
      int imageHeight = img.height / numY;
      int imageX = imageWidth * i;
      int imageY = imageHeight * j;

      PImage partOfImage = img.get(imageX, imageY, imageWidth, imageHeight);
      image(partOfImage, 0, 0, stepX, stepY);
      pop();
    }
  }
}
  public void settings() {  size(1000, 1000, P3D); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "grid3d" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
