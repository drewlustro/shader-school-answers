precision mediump float;

attribute vec3 position;
attribute vec3 normal;

uniform mat4 model;
uniform mat4 view;
uniform mat4 projection;

uniform mat4 inverseModel;
uniform mat4 inverseView;
uniform mat4 inverseProjection;

uniform vec3 ambient;
uniform vec3 diffuse;
uniform vec3 lightDirection;

varying vec3 vColor;

// transpose() doesn't exist in shader-school's glsl :( Implement manually
// http://stackoverflow.com/a/18038495/1299302
mat4 transpose(in mat4 inMatrix) {
   vec4 i0 = inMatrix[0];
   vec4 i1 = inMatrix[1];
   vec4 i2 = inMatrix[2];
   vec4 i3 = inMatrix[3];

   mat4 outMatrix = mat4(
                   vec4(i0.x, i1.x, i2.x, i3.x),
                   vec4(i0.y, i1.y, i2.y, i3.y),
                   vec4(i0.z, i1.z, i2.z, i3.z),
                   vec4(i0.w, i1.w, i2.w, i3.w)
                   );
  return outMatrix;
}

void main() {
  gl_Position = projection * view * model * vec4(position, 1.0);

  // See https://www.cs.uaf.edu/2007/spring/cs481/lecture/01_23_matrices.html, "Normal Matrix"
  mat3 normalMatrix = mat3(transpose(inverseModel * inverseView));
  // Adjust normal into eye space
  vec3 viewNormal = normalMatrix * normal;

  float brightness = dot(viewNormal, lightDirection);
  vColor = diffuse * max(brightness, 0.0);
}
