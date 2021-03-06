PGraphics frameBuffer;
PShader postProcessingShader;

void setup () {
  size(400, 400, P2D);
  frameBuffer = createGraphics(400, 400);
  postProcessingShader = loadShader("post-processing-frag.glsl", "post-processing-vert.glsl");
}

void draw () {
  frameBuffer.beginDraw();
  renderBuffer();
  frameBuffer.endDraw();

  postProcessingShader.set("bufferTexture", frameBuffer);
  rect(0, 0, width, height);
  shader(postProcessingShader);
}

// Use this function and the "frameBuffer" variable to draw your black&white shapes.
void renderBuffer () {
  frameBuffer.background(0);
  frameBuffer.blendMode(DIFFERENCE);
  frameBuffer.fill(255);
  frameBuffer.ellipse(width * 0.5, height * 0.5, width * 0.3, height * 0.3);
  frameBuffer.ellipse(mouseX, mouseY, width * 0.3, height * 0.3);
  frameBuffer.ellipse(width - mouseX, height - mouseY, width * 0.3, height * 0.3);
  frameBuffer.ellipse(mouseX, height - mouseY, width * 0.3, height * 0.3);
  frameBuffer.ellipse(width - mouseX, mouseY, width * 0.3, height * 0.3);
}
