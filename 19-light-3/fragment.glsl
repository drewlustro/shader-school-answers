precision mediump float;

uniform mat4 model, view, projection;
uniform mat4 inverseModel, inverseView, inverseProjection;
uniform vec3 ambient, diffuse, specular, lightDirection;
uniform float shininess;

varying vec3 vEyeDirection;
varying vec3 vNormal;

void main() {
  // Normalize interpolated vectors
  vec3 eyeDirection = normalize(vEyeDirection);
  vec3 normal = normalize(vNormal);

  vec3 rlight = reflect(lightDirection, normal);
  float eyeLight = max(dot(rlight, eyeDirection), 0.0);
  float phong = pow(eyeLight, shininess);

  // float lambert = max(dot(normal, lightDirection), 0.0); // <- Should be correct. Bug with shader-school?
  float lambert = dot(normal, lightDirection);

  vec3 finalColor = ambient + diffuse * lambert + specular * phong;
  gl_FragColor = vec4(finalColor, 1.0);
}