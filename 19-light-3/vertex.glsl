precision mediump float;

attribute vec3 position, normal;
uniform mat4 model, view, projection;
uniform mat4 inverseModel, inverseView, inverseProjection;
uniform vec3 ambient, diffuse, specular, lightDirection;
uniform float shininess;

varying vec3 vEyeDirection;
varying vec3 vNormal;

// Great overview of Phong specular shading here:
// https://www.youtube.com/watch?t=22&v=jWaeoKI4cwY

void main() {
  vec4 viewPosition = view * model * vec4(position, 1.0);
  gl_Position = projection * viewPosition;

  // See https://www.cs.uaf.edu/2007/spring/cs481/lecture/01_23_matrices.html, "Normal Matrix"
  vNormal = (vec4(normal, 0.0) * inverseModel * inverseView).xyz;

  // Eye to vertex position
  vEyeDirection = normalize(viewPosition.xyz);
}
