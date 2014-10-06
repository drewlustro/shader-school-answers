precision highp float;

uniform sampler2D texture;
uniform vec2 screenSize;

void main() {
  vec2 coord = gl_FragCoord.xy / screenSize;

  //TODO: Swap red and blue color channels of image
  vec4 color = texture2D(texture, coord);
  vec4 swapped = vec4(color.b, color.g, color.r, 1.0);
  gl_FragColor = swapped;
  // gl_FragColor = texture2D(texture, coord);
}
