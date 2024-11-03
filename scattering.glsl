#define MAX_STEPS 10
#define ALLOWED_DEVIATION 0.01
#define earthSize 6400.0
#define atmoThickness 100.0

float cos2(float theta){
  return (cos(2.0 * theta)+  1.0) / 2.0;
}

float lengthVec(vec3 p1, vec3 p2){
  return distance(p1, p2);
}

float distanceToCircle(vec3 p, vec3 center, float r){
  return abs(lengthVec(p, center) - r);
}

//pos is vec3(0.0, playerY, 0.0);
//dir is ray direction normalised
float sphereMarch(vec3 pos, vec3 dir){
  float progress = 0.0;
  vec3 samplePoint = pos;

  for(int i=0; i < MAX_STEPS; ++i)
  {
    samplePoint = pos + dir * progress;
    float distance = distanceToCircle(samplePoint, vec3(0.0, -earthSize, 0.0), atmoThickness);
    progress += distance;
    if(distance < ALLOWED_DEVIATION){
      return progress;
    }
  }

  return 0.0;
}

float henyeyGreenstein(float g, float angle) {
  float front = (3.0 * (1.0 - pow(g, 2))) / (2.0 * (2.0 + pow(g, 2.0);
  float back = (1.0 + cos2(angle)) / pow((1.0 + pow(g, 2.0) - 2.0 * g * cos(angle)), 3.0 / 2.0);
  return front * back;
}

// add sphere raymarch
//add inscatering
//add outscattering

