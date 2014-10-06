vec3 reflectPoint(vec3 p, vec3 n) {
  return p - 2.0 * dot(n, p) * n / dot(n, n);
}

highp mat4 reflection(highp vec3 n) {

  //TODO: Return a matrix that reflects all points about the plane passing through the origin with normal n
  n = normalize(n);
  mat4 reflectedmat = mat4(1.0 - 2.0 * n.x * n.x, -2.0 * n.y * n.x, -2.0 * n.z * n.x, 0,
                           -2.0 * n.x * n.y, 1.0 - 2.0 * n.y * n.y, -2.0 * n.z * n.y, 0,
                           -2.0 * n.x * n.z, -2.0 * n.y * n.z, 1.0 - 2.0 * n.z * n.z, 0,
                           0, 0, 0, 1.0);
  // reflectedmat = 2.0 * reflectedmat;
  return reflectedmat;
}

#pragma glslify: export(reflection)
