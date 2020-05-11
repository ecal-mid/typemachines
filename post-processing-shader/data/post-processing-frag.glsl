#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

uniform float color;
uniform sampler2D bufferTexture;

varying vec4 vertTexCoord;
varying vec2 uv;

void main() {
  vec4 bufferColor = texture2D(bufferTexture, uv);

  vec3 blue = vec3(0, 0, 1);
  vec3 grey = vec3(0.5, 0.5, 0.5);
  float weight = (bufferColor.r + bufferColor.g + bufferColor.b) / 3;
  vec3 outColor = mix(blue, grey, weight);

  gl_FragColor = vec4(outColor, 1);
}