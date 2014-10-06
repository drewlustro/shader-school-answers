bool mandelbrotConverges(vec2 z) {
  return length(z) < 2.0;
}

vec2 mandelbrotIter(vec2 z, vec2 c) {
  return vec2(z.x * z.x - z.y * z.y, 2.0 * z.x * z.y) + c;
}

bool mandelbrot(highp vec2 c) {

  //Test if the point c is inside the mandelbrot set after 100 iterations
  highp vec2 z = vec2(0.0);
  highp vec2 zrun = z;
  for (int i = 0; i < 100; i++) {
    zrun = mandelbrotIter(zrun, c);
  }

  return mandelbrotConverges(zrun);
}




//Do not change this line or the name of the above function
#pragma glslify: export(mandelbrot)
