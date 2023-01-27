class Measurements {
  //inputs from current measurements
  float height, weight, neck, waist, hip, age, activityFactor;
  
  Measurements(float h, float w, float neck, float waist, float hip, float age, float af) {
    this.height = h;
    this.weight = w;
    this.neck = neck;
    this.waist = waist;
    this.hip = hip;
    this.age = age;
    this.activityFactor = af/5+1;
  }
}
