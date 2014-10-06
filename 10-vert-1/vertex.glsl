precision highp float;

uniform float theta;

attribute vec2 position;

void main() {
  vec4 p = vec4(position, 0, 1.0);
  float deg = theta;
  // mat4 rotateX = mat4(1.0, 0, 0, 0,
  //                    0, cos(deg), -sin(deg), 0,
  //                    0, sin(deg), cos(deg), 0,
  //                    0, 0, 0, 1.0);
  mat4 rotateZ = mat4(cos(-deg), -sin(-deg), 0, 0,
                      sin(-deg), cos(-deg), 0, 0,
                      0, 0, 1, 0,
                      0, 0, 0, 1);

                     // 0, cos(deg), -sin(deg), 0,
                     // 0, sin(deg), cos(deg), 0,
                     // 0, 0, 0, 1.0);
  p = rotateZ * p;
  //TODO: rotate position by theta radians about the origin

  gl_Position = p;
}
