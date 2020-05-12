uniform mat4 transform;
uniform mat4 texMatrix;

attribute vec4 position;
attribute vec2 texCoord;

varying vec2 uv;

void main() {
  uv = texCoord;
  gl_Position = transform * position;
}