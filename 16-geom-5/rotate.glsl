vec3 rotatePoint(vec3 p, vec3 n, float theta) {
  return (
    p * cos(theta) + cross(n, p) *
    sin(theta) + n * dot(p, n) *
    (1.0 - cos(theta))
  );
}

mat4 rotationMatrix(vec3 axis, float angle)
{
    axis = normalize(axis);
    float s = sin(angle);
    float c = cos(angle);
    float oc = 1.0 - c;

    return mat4(oc * axis.x * axis.x + c, oc * axis.x * axis.y - axis.z * s,  oc * axis.z * axis.x + axis.y * s,  0.0,
                oc * axis.x * axis.y + axis.z * s,  oc * axis.y * axis.y + c, oc * axis.y * axis.z - axis.x * s,  0.0,
                oc * axis.z * axis.x - axis.y * s,  oc * axis.y * axis.z + axis.x * s,  oc * axis.z * axis.z + c,  0.0,
                0, 0, 0, 1.0);
}

// cos(theta) + cross(n,p) * sin(theta) + n * cos(theta) * (1.0 - cos(theta))

highp mat4 rotation(highp vec3 n, highp float theta) {

  //TODO: Using Rodrigues' formula, find a matrix which performs a rotation about the axis n by theta radians
  // vec3 rotated = vec3(cos(theta) + sin(theta) * sin(theta) + 1.0 * cos(theta) * (1.0 - cos(theta)));
  float rotated = cos(theta) + sin(theta) * sin(theta) + 1.0 * cos(theta) * (1.0 - cos(theta));

  return rotationMatrix(-n, theta);
  // mat4 matn = mat4(1.0);
  // mat4 m = mat4(vec4(normalize(n), 1.0) * matn);
  // vec4 rotp = vec4(rotatePoint(vec3(1.0), n, theta), 1.0);

  // m = rotp * m;
  // return m;


  // return mat4(1, 0, 0, 0,
  //             0, 1, 0, 0,
  //             0, 0, 1, 0,
  //             0, 0, 0, 1);
}

#pragma glslify: export(rotation)
