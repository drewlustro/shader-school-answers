highp vec2 func(highp vec2 a, highp vec2 b) {

  // In this situation, the angle bisector theorem tells us the following information about the ratio of the lengths of these vectors:
  // B
  // ^
  // |\
  // | \^ C
  // | /\
  // |/  \
  // *----> A
  // O
  // length(B - C) / length(C - A) == length(B) / length(A)
  float lenA = length(a);
  float lenB = length(b);
  highp vec2 c = vec2((lenB * a.x + lenA * b.x), (lenB * a.y + lenA * b.y));
  // float lenAB = sqrt(pow(lenA, 2) + pow(lenB, 2));
  return normalize(c);
}

//Do not change this line
#pragma glslify: export(func)
