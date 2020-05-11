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

void renderBuffer () {
  frameBuffer.background(0);
  frameBuffer.fill(255);
  frameBuffer.ellipse(width * 0.5, height * 0.5, width * 0.3, height * 0.3);

  frameBuffer.fill(255);
  frameBuffer.blendMode(DIFFERENCE);
  frameBuffer.ellipse(mouseX, mouseY, width * 0.3, height * 0.3);
}
