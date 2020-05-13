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

public class lerp extends PApplet {

float x;
float y;
float radius;
float targetRadius;

public void setup() {
    
    radius = 0;
    targetRadius = 100;
}

public void draw() {
    background(0);
    ellipse(x, y, radius, radius);

    x += (mouseX - x) * 0.1f;
    y += (mouseY - y) * 0.1f;
    radius += (targetRadius - radius) * 0.1f;

    if (frameCount % 100 == 0) {
        targetRadius = random(50, 200);
    }
}
  public void settings() {  size(1000, 1000); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "lerp" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
