#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

uniform sampler2D map;
varying vec2 uv;

const int indexMatrix8x8[64] = int[](
  0,  32, 8,  40, 2,  34, 10, 42,
  48, 16, 56, 24, 50, 18, 58, 26,
  12, 44, 4,  36, 14, 46, 6,  38,
  60, 28, 52, 20, 62, 30, 54, 22,
  3,  35, 11, 43, 1,  33, 9,  41,
  51, 19, 59, 27, 49, 17, 57, 25,
  15, 47, 7,  39, 13, 45, 5,  37,
  63, 31, 55, 23, 61, 29, 53, 21
);

float indexValue() {
  int x = int(mod(gl_FragCoord.x, 8.0));
  int y = int(mod(gl_FragCoord.y, 8.0));
  return float(indexMatrix8x8[x + y * 8]) / 64.0;
}

float dither(float color) {
  float closestColor = (color < 0.5) ? 0.0 : 1.0;
  float secondClosestColor = 1.0 - closestColor;
  float d = indexValue();
  float distance = abs(closestColor - color);
  return (distance <= d) ? closestColor : secondClosestColor;
}

void main() {
  gl_FragColor = vec4(uv.rg, 1.0, 1);
}