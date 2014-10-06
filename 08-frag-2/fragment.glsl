precision highp float;

// #define CHECKSIZE vec2(16.0,16.0)
// #define CHECKSKIP CHECKSIZE*2.0
// #define ZERO vec2(0.0)

// gl-shader: Error compiling fragment shader:ERROR: 0:14: '<' : wrong operand types no operation '<' exists that takes a left-hand operand of type '2-component vector of float' and a right operand of type 'const mediump 2-component vector of float' (or there is no acceptable conversion)

// gl-shader: Error compiling fragment shader:ERROR: 0:13: '*' : wrong operand types no operation '*' exists that takes a left-hand operand of type 'const mediump 2-component vector of float' and a right operand of type 'const mediump int' (or there is no acceptable conversion) ERROR: 0:14: '<' : wrong operand types no operation '<' exists that takes a left-hand operand of type '2-component vector of float' and a right operand of type 'const mediump 2-component vector of float' (or there is no acceptable conversion)

void main() {

  //TODO: Replace this with a function that draws a checkerboard
  vec2 point = gl_FragCoord.xy;
  vec2 remain = mod(point, 32.0);
  if (remain.y >= 16.0 && remain.x < 16.0) {
    discard;
  } else if (remain.y < 16.0 && remain.x >= 16.0) {
    discard;
  } else {
    gl_FragColor = vec4(1.0,1.0,1.0,1.0);
  }
  // if (remain.x > 16.0 && remain.y > 16.0) {
  //   gl_FragColor = vec4(1.0,1.0,1.0,1.0);
  // } else if (remain.x <= 16.0 && remain.y < 32.0) {
  //   gl_FragColor = vec4(1.0,1.0,1.0,1.0);
  // } else {
  //   discard;

  // }
  // vec2 size = vec2(16.0, 16.0);
  // point = floor(point / size);


  // if (mod(point.x, 2.0) == 0.0 && mod(point.y, 2.0) == 0.0) {
  //   gl_FragColor = vec4(1.0, 1.0);
  // } else {
  //   discard;
  // }
  // discard;

}
