#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

uniform float offsetX;
uniform float offsetY;
uniform sampler2D noiseTexture;

varying vec2 uv;

void main() {
  vec4 textureColor = texture2D(noiseTexture, vec2(uv.x * 0.2 + offsetX, uv.y * 0.2 + offsetY));
  float brightness = (textureColor.r + textureColor.g + textureColor.b) / 3;
  float dx = dFdx(brightness);
  float dy = dFdy(brightness);
  vec2 dir = 0.5 - normalize(vec2(dx, dy)) * 0.5;
  gl_FragColor = vec4(dir, 1, 1);
}