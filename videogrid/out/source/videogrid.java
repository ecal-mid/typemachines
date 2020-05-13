import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import processing.video.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class videogrid extends PApplet {



Movie myMovie;
PGraphics videoCanvas;
PGraphics canvas;

int gridX = 32;
int gridY = 16;

public void setup() {
    
    canvas = createGraphics(500, 500, P3D);
    videoCanvas = createGraphics(gridX, gridY, P2D);
    myMovie = new Movie(this, "video.mp4");
    myMovie.loop();
}

public void draw() {
    videoCanvas.beginDraw();
    videoCanvas.background(0);
    videoCanvas.image(myMovie, 0, 0, videoCanvas.width, videoCanvas.height);
    videoCanvas.filter(BLUR, 1);
    videoCanvas.endDraw();
    videoCanvas.updatePixels();

    canvas.beginDraw();
    canvas.background(0);
    canvas.rectMode(CENTER);
    float stepX = PApplet.parseFloat(canvas.width) / PApplet.parseFloat(gridX - 1);
    float stepY = PApplet.parseFloat(canvas.height) / PApplet.parseFloat(gridY - 1);

    for (int j = 0; j < gridY; j++) {
        for(int i = 0; i < gridX; i++) {
            int pixel = videoCanvas.pixels[j * gridX + i];
            canvas.push();
            canvas.translate(stepX * i, stepY * j);
            canvas.rotateY(red(pixel) / 255 * PI * 2);
            canvas.fill(255);
            canvas.stroke(0);
            canvas.rect(0, 0, stepX, stepY);
            canvas.pop();
        }
    }
    canvas.endDraw();

    image(videoCanvas, 0, 0, 500, 500);
    image(canvas, 500, 0, 500, 500);
}

public void movieEvent(Movie movie) {
  movie.read();
}
  public void settings() {  size(1000, 500, P3D); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "videogrid" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
