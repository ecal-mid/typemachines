uniform mat4 transform;

attribute vec4 position;
attribute vec2 texCoord;

varying vec2 uv;

void main() {
  uv = texCoord;
  gl_Position = transform * position;
}