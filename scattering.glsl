float cos2(float theta){
  return (cos(2.0 * theta)+  1.0) / 2.0;
}

float length(vec3 p1, vec3 p2){
  return distance(p1, p2)
}

float henyeyGreenstein(float g, float angle) {
  float front = (3.0 * (1.0 - pow(g, 2))) / (2.0 * (2.0 + pow(g, 2.0);
  float back = (1.0 + cos2(angle)) / pow((1.0 + pow(g, 2.0) - 2.0 * g * cos(angle)), 3.0 / 2.0);
  return front * back;
}

// add sphere raymarch
//add inscatering
//add outscattering

