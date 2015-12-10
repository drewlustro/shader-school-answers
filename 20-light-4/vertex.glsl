precision highp float;

attribute vec4 position, normal;

uniform mat4 model, view, projection;
uniform mat4 inverseModel, inverseView, inverseProjection;
uniform vec3 ambient, diffuse, specular, lightPosition;
uniform float shininess;

varying vec3 lightDirection;

varying vec4 viewPosition;
varying vec3 vEyeDirection;
varying vec3 vNormal;

void main() {

  vec4 viewPosition = view * model * position;
  gl_Position = projection * viewPosition;

  // See https://www.cs.uaf.edu/2007/spring/cs481/lecture/01_23_matrices.html, "Normal Matrix"
  vNormal = (normal * inverseModel * inverseView).xyz;

  // Eye to vertex position
  vEyeDirection = normalize(viewPosition.xyz);

  // calculate the lightDirection
  vec4 modelPos = model * position;
  vec4 modelLightPos = model * vec4(lightPosition, 1.0);
  //vec4 surfacePos = position * inverseModel * inverseView;
  //vec4 lightPos = view * model * vec4(lightPosition, 1.0);
  lightDirection = (modelLightPos - modelPos).xyz;
}
