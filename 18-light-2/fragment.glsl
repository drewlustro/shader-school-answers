precision highp float;

uniform mat4 model, view, projection;
uniform mat4 inverseModel, inverseView, inverseProjection;
uniform vec3 ambient, diffuse, lightDirection;

varying vec3 reflectedLightVec;
varying float lambertWeightVal;
varying vec4 inverseSurfaceNormal;
varying vec4 p;

float parallelDistance(vec3 surfacePoint, vec3 surfaceNormal, vec3 p) {
  return dot(p - surfacePoint, surfaceNormal);
}

void main() {
  // vec4 red = vec4(clamp(vec4(1.0, 0, 0, 1.0) + vec4(ambient, 1.0), 0.0, 1.0));
  float parallelDistanceVal = parallelDistance(vec3(gl_FragCoord.xyz), vec3(inverseSurfaceNormal.xyz), normalize(vec3(p)));
  vec4 red = 1.0 - normalize(vec4(ambient, 1.0) * normalize(parallelDistanceVal));
  vec4 color = red * lambertWeightVal - (1.0 - vec4(normalize(reflectedLightVec.xyz), 1.0));
  gl_FragColor = color;

}
