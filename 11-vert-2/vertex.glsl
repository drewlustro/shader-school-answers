precision highp float;

attribute vec4 position;
attribute vec3 color;

varying vec4 fragPosition;
varying vec4 vTop;
varying vec4 vLeft;
varying vec4 vRight;
varying vec3 vColor;

void main() {
  vTop = vec4(0, 100.0, 0, 1.0);
  vLeft = vec4(-100.0, 0, 0, 1.0);
  vRight = vec4(100.0, 0, 0, 1.0);
  fragPosition = position;
  vColor = color;
  gl_Position = position;
}
