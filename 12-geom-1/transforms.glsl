precision highp float;

attribute vec3 position;

uniform mat4 model, view, projection;

void main() {

  //TODO: Apply the model-view-projection matrix to `position`
  gl_Position = (projection * view * model) * vec4(position, 1.0);
  // gl_Position = vec4(position, 1);
}
