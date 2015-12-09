mat2 matrixPower(in highp mat2 m, in int n) {
  // provide constant limit for loop when raising mat power
  const int MAX_POWER = 16;

  //Raise the matrix m to nth power
  if (n == 0) {
    return mat2(1.0);
  }

  highp mat2 p = mat2(1.0) * m; // copy
  for(int i = 1; i < MAX_POWER; i++) {
    if (i == n) return p;
    p *= m;
  }
  return p;
}

//Do not change this line or the name of the above function
#pragma glslify: export(matrixPower)
