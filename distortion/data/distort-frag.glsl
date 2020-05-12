#ifdef GL_ES
precision mediump float;
precision mediump int;
#endif

uniform sampler2D map;
uniform sampler2D normalMap;

varying vec2 uv;

void main() {
  vec4 normalColor = texture2D(normalMap, uv);
  vec2 distortedUV = uv + (0.5 - normalColor.rg * 2) * 0.05;
  vec4 mapColor = texture2D(map, distortedUV);
  gl_FragColor = vec4(mapColor.rgb, 1);
}