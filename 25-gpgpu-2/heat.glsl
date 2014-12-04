precision mediump float;

uniform sampler2D prevState;
uniform vec2 stateSize;
uniform float kDiffuse;
uniform float kDamping;

// float laplace(x, y) {
//   return (prevState(x-1,y) + prevState(x+1,y) + prevState(x,y-1) + prevState(x,y+1)) - 4.0 * prevState(x,y);
// }


float state(vec2 x) {
  return texture2D(prevState, fract(x / stateSize)).r;
}

void main() {
  vec2 coord = gl_FragCoord.xy;

  //TODO: Compute next state using a 5-point Laplacian stencil and the rule

  float x = coord.x;
  float y = coord.y;

  // vec2 nextState = (1.0 - kDamping) * (kDiffuse * laplace(x,y) + prevState(x,y));

  // float n = state(nextState);
  float n = state(vec2(x));


  gl_FragColor = vec4(n,n,n,1);
}

// nextState(x,y) = (1.0 - kDamping) * (
//   kDiffuse * laplace(x,y) + prevState(x,y)
// )


//      ( d^2 f   d^2 f )            d f
// kD * ( ----- + ----- ) - kM * f = ---
//      ( d x^2   d y^2 )            d t
