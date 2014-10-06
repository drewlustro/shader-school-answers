precision highp float;

attribute vec4 position, normal;
uniform mat4 model, view, projection;
uniform mat4 inverseModel, inverseView, inverseProjection;
uniform vec3 ambient, diffuse, lightDirection;

varying vec3 reflectedLightVec;
varying float lambertWeightVal;
varying vec4 inverseSurfaceNormal;
varying vec4 p;

vec3 reflectedLight(vec3 normal, vec3 lightDirection, vec3 ambient, vec3 diffuse) {
  float brightness = dot(normal, lightDirection);
  return ambient + diffuse * max(brightness, 0.0);
}

float lambertWeight(vec3 n, vec3 d) {
  return max(dot(n, d), 0.0);
}

float parallelDistance(vec3 surfacePoint, vec3 surfaceNormal, vec3 p) {
  return dot(p - surfacePoint, surfaceNormal);
}

void main() {
  vec4 inverseSurfacePos = (inverseProjection * inverseModel * inverseView) * position;
  inverseSurfaceNormal = (inverseModel) * normal;
  p = position;
  // parallelDistanceVal = parallelDistance(vec3(position.xyz), vec3(inverseSurfaceNormal.xyz), vec3(position.xyz));
  lambertWeightVal = lambertWeight(vec3(normal.xyz), normalize(lightDirection));

  reflectedLightVec = reflectedLight(vec3(normal.xyz), normalize(lightDirection), ambient, diffuse);


  gl_Position = (projection * model * view) * position;

}

