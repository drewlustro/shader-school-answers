mat2 matrixPower(highp mat2 m, int n) {
  
  //Raise the matrix m to nth power

  if (n == 0) {
    return mat2(1.0);
  }

  highp mat2 p = mat2(1.0) * m; // copy
  for(int i = 1; i < 16; i++) {
    if (i == n) return p;
    p *= m;
  }
  return p;
}

//Do not change this line or the name of the above function
#pragma glslify: export(matrixPower)
