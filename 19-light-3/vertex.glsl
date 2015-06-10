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
  vec4 viewPosition = view * model * vec4(position, 1.0);
  gl_Position = projection * viewPosition;

  // See https://www.cs.uaf.edu/2007/spring/cs481/lecture/01_23_matrices.html, "Normal Matrix"
  mat3 normalMatrix = mat3(transpose(inverseModel * inverseView));

  // Adjust normal into eye space
  vNormal = normalMatrix * normal;

  // Eye to vertex position
  vEyeDirection = normalize(viewPosition.xyz);
}
