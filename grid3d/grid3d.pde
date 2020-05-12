int numX;
int numY;
PImage img;

void setup() {
  size(1000, 1000, P3D);
  numX = 10;
  numY = 10;
  img = loadImage("img.jpeg");
  rectMode(CENTER);
  imageMode(CENTER);
}

void draw() {
  background(0);

  for (int j = 0; j < numY; j++) {
    for (int i = 0; i < numX; i++) {
      int stepX = width / numX;
      int stepY = height / numY;
      int x = stepX * i;
      int y = stepY * j;

      push();
      float varyingValue = sin(millis() * 0.001 + i * 0.2 + j * 0.2);
      translate(x + stepX * 0.5, y + stepY * 0.5, varyingValue * 100);
      rotateY(varyingValue * 0.5);

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