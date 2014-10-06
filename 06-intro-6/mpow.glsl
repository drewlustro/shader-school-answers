mat2 matrixPower(highp mat2 m, const int n) {

  //Raise the matrix m to nth power

  // For example:
  //  matrixPower(m, 2) = m * m

  highp mat2 p = mat2(1.0) * m;
  for(int i = 1; i < 16; i++) {
    if (i == n) return p;
    p *= m;
  }

  return p;
}

//Do not change this line or the name of the above function
#pragma glslify: export(matrixPower)
