precision highp float;

varying vec4 fragPosition;
varying vec3 vColor;
// varying vec4 vTop;
// varying vec4 vLeft;
// varying vec4 vRight;

void main() {
  // gl_FragColor = vec4(fragPosition.y * 2.0, fragPosition.z * 2.0, fragPosition.x * 2.0,1.0);
  gl_FragColor = vec4(vColor, 1.0);
}
