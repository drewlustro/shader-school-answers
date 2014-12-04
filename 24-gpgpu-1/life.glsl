precision highp float;

uniform sampler2D prevState;
uniform vec2 stateSize;

const vec2 neighbor0 = vec2(-1.0, -1.0);
const vec2 neighbor1 = vec2(0.0, -1.0);
const vec2 neighbor2 = vec2(1.0, -1.0);
const vec2 neighbor3 = vec2(1.0, 0.0);
const vec2 neighbor4 = vec2(1.0, 1.0);
const vec2 neighbor5 = vec2(0.0, 1.0);
const vec2 neighbor6 = vec2(-1.0, 1.0);
const vec2 neighbor7 = vec2(-1.0, 0.0);

void wrapBoundary(inout vec2 coord) {
  bvec2 topLeftBoundary = lessThan(coord, vec2(0.0, 0.0));
  bvec2 bottomRightBoundary = greaterThan(coord, stateSize);
  if (any(topLeftBoundary)) {
    if (topLeftBoundary.x) {
      coord.x = stateSize.x;
    }
    if (topLeftBoundary.y) {
      coord.y = stateSize.y;
    }
  }

  if (any(bottomRightBoundary)) {
    if (bottomRightBoundary.x) {
      coord.x = 0.0;
    }
    if (bottomRightBoundary.y) {
      coord.y = 0.0;
    }
  }
}

bool isStateOn(vec2 coord, inout int count) {
  wrapBoundary(coord);
  float prevStateCell = texture2D(prevState, fract(coord / stateSize)).r;

  if (prevStateCell >= 1.0) {
    count++;
    return true;
  }
  return false;
}

int numNeighborsOn(vec2 coord) {
  int neighbors = 0;
  isStateOn(vec2(coord - neighbor0), neighbors);
  isStateOn(vec2(coord - neighbor1), neighbors);
  isStateOn(vec2(coord - neighbor2), neighbors);
  isStateOn(vec2(coord - neighbor3), neighbors);
  isStateOn(vec2(coord - neighbor4), neighbors);
  isStateOn(vec2(coord - neighbor5), neighbors);
  isStateOn(vec2(coord - neighbor6), neighbors);
  isStateOn(vec2(coord - neighbor7), neighbors);
  return neighbors;
}

void main() {
  vec2 coord = gl_FragCoord.xy;
  int junk = 0;
  int neighbors = 0;
  float s = 0.0; // AUTO-DEATH
  neighbors = numNeighborsOn(coord);
  if (isStateOn(coord, junk)) { // IF ON AND 2 OR 3 NEIGHBORS
    if (neighbors == 2 || neighbors == 3) {
      s = 1.0;
    }
  } else if (neighbors == 3) { // CELL OFF
    s = 1.0;
  }

  gl_FragColor = vec4(s,s,s, 1.0);
}
