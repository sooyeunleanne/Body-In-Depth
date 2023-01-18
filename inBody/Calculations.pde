class Calculations {
  Measurements m;
  String gender;
  float bmi, bmr, bfp, bfm, lbm, tbw, caloricNeeds;
  
  Calculations(Measurements mInput, String g) {
    this.m = mInput;
    this.gender = g;
  }
  
  void computeInBody() {
    float h = this.m.height;
    float w = this.m.weight;
    float neck = this.m.neck;
    float waist = this.m.waist;
    float hip = this.m.hip;
    float age = this.m.age;
    float af = this.m.activityFactor;
    
    this.bmi = w/pow(h/100, 2);
    if (this.gender.equals("male")) {
      this.bmr = 88.362 + 13.397*w + 4.799*h - 5.677*age;
      this.bfp = 495/(1.0324 - 0.19077*log(waist-neck)/log(10) + 0.15456*log(h)/log(10)) - 450;
      this.bfm = this.bfp*w/100;
      this.lbm = w - this.bfm;
      this.tbw = (2.447 - 0.09156*age + 0.1074*h + 0.3362*w)/this.m.weight*100;
    }
    else {
      this.bmr = 447.593 + 9.247*w + 3.098*h - 4.330*age;
      this.bfp = 495/(1.29579 - 0.35004*log(waist+hip-neck)/log(10) + 0.221*log(h)/log(10)) - 450;
      this.bfm = this.bfp*w/100;
      this.lbm = w - this.bfm;
      this.tbw = (-2.097 + 0.1069*h + 0.2466*w)/this.m.weight*100;
    }
    this.caloricNeeds = this.bmr * af;
  }
  
  void compare() {
    int overweight = 0;
    int underweight = 0;
    
    if (this.bmi > 25) {
      overweight += 1;
    }
    else if (this.bmi < 18.5) {
      underweight += 1;
    }
    
    if (this.gender.equals("male")) {
      if (this.bfp > 25) {
        overweight += 1;
      }
      else if (this.bfp < 14) {
        underweight += 1;
      }
    }
    else {
      if (this.bfp > 32) {
        overweight += 1;
      }
      else if (this.bfp < 21) {
        underweight += 1;
      }
    }
    
    if (overweight == 2) {
      println("You're overweight");
    }
    else if (underweight == 2) {
      println("You're underweight");
    }
    else {
      println("You're fit");
    }
  }
}
