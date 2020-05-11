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

public class postprocessing extends PApplet {

PGraphics frameBuffer;
PShader postProcessingShader;

public void setup () {
  
  frameBuffer = createGraphics(400, 400);
  postProcessingShader = loadShader("post-processing-frag.glsl", "post-processing-vert.glsl");
}

public void draw () {
  frameBuffer.beginDraw();
  renderBuffer();
  frameBuffer.endDraw();

  postProcessingShader.set("bufferTexture", frameBuffer);
  rect(0, 0, width, height);
  shader(postProcessingShader);
}

// Use this function and the "frameBuffer" variable to draw your black&white shapes.
public void renderBuffer () {
  frameBuffer.background(0);
  frameBuffer.fill(255);
  frameBuffer.ellipse(width * 0.5f, height * 0.5f, width * 0.3f, height * 0.3f);

  frameBuffer.fill(255);
  frameBuffer.blendMode(DIFFERENCE);
  frameBuffer.ellipse(mouseX, mouseY, width * 0.3f, height * 0.3f);
}
  public void settings() {  size(400, 400, P2D); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "postprocessing" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
