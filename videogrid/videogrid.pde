import processing.video.*;

Movie myMovie;
PGraphics videoCanvas;
PGraphics canvas;

int gridX = 32;
int gridY = 16;

void setup() {
    size(1000, 500, P3D);
    canvas = createGraphics(500, 500, P3D);
    videoCanvas = createGraphics(gridX, gridY, P2D);
    myMovie = new Movie(this, "video.mp4");
    myMovie.loop();
}

void draw() {
    videoCanvas.beginDraw();
    videoCanvas.background(0);
    videoCanvas.image(myMovie, 0, 0, videoCanvas.width, videoCanvas.height);
    videoCanvas.filter(BLUR, 1);
    videoCanvas.endDraw();
    videoCanvas.updatePixels();

    canvas.beginDraw();
    canvas.background(0);
    canvas.rectMode(CENTER);
    float stepX = float(canvas.width) / float(gridX - 1);
    float stepY = float(canvas.height) / float(gridY - 1);

    for (int j = 0; j < gridY; j++) {
        for(int i = 0; i < gridX; i++) {
            color pixel = videoCanvas.pixels[j * gridX + i];
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

void movieEvent(Movie movie) {
  movie.read();
}