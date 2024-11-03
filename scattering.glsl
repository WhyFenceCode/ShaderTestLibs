#define PI 3.14159265359

#define MAX_STEPS 10
#define ALLOWED_DEVIATION 0.01
#define EARTHSIZE 6400000.0
#define ATMOTHICKNESS 100000.0
#define ATMOAVGHEIGHT 0.25

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
    float distance = distanceToCircle(samplePoint, vec3(0.0, -EARTHSIZE, 0.0), ATMOTHICKNESS);
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

//rayLength is the result of the spheremarch
//lambda is the wavelength of the current scatter channel
//k is the scattering channel
float outScattering(float startPoint, float rayLength, float lambda, float k){
  float front =  4 * PI * pow(lambda, -k);
  float back = ATMOAVGHEIGHT * (exp(-startPoint/ATMOAVGHEIGHT) - exp(-rayLength/ATMOAVGHEIGHT);
  return front*back
}

//add inscatering
//add outscattering

