class Calculations {
  Measurements m;
  String gender;
  float bmi, bmr, bfp, bfm, lbm, tbw, caloricNeeds;
  String analysis;
  
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
    
    this.bmi = round2DP(w/pow(h/100, 2));
    if (this.gender.equals("male")) {
      this.bmr = round2DP(88.362 + 13.397*w + 4.799*h - 5.677*age);
      this.bfp = round2DP(495/(1.0324 - 0.19077*log(waist-neck)/log(10) + 0.15456*log(h)/log(10)) - 450);
      this.bfm = round2DP(this.bfp*w/100);
      this.lbm = round2DP(w - this.bfm);
      this.tbw = round2DP((2.447 - 0.09156*age + 0.1074*h + 0.3362*w)/this.m.weight*100);
    }
    else {
      this.bmr = round2DP(447.593 + 9.247*w + 3.098*h - 4.330*age);
      this.bfp = round2DP(495/(1.29579 - 0.35004*log(waist+hip-neck)/log(10) + 0.221*log(h)/log(10)) - 450);
      this.bfm = round2DP(this.bfp*w/100);
      this.lbm = round2DP(w - this.bfm);
      this.tbw = round2DP((-2.097 + 0.1069*h + 0.2466*w)/this.m.weight*100);
    }
    this.caloricNeeds = round2DP(this.bmr * af);
  }
  
  String compare() {
    int overweight = 0;
    int underweight = 0;
    
    if (this.bmi <= 18.5) {
      underweight += 1;
    }
    else if (this.bmi <= 24.9) {
      //do nothing
    }
    else if (this.bmi <= 29.9) {
      overweight += 1;
    }
    else {
      overweight += 2;
    }
      
    if (this.gender.equals("male")) {
      if (this.bfp <= 5) {
        underweight += 2;
      }
      else if (this.bfp <= 13) {
        underweight += 1;
      }
      else if (this.bfp <= 17) {
        //do nothing
      }
      else if (this.bfp <= 24) {
        overweight += 1;
      }
      else {
        overweight += 2;
      }
    }
    else {
      if (this.bfp <= 13) {
        underweight += 2;
      }
      else if (this.bfp <= 20) {
        underweight += 1;
      }
      else if (this.bfp <= 24) {
        //do nothing
      }
      else if (this.bfp <= 30) {
        overweight += 1;
      }
      else {
        overweight += 2;
      }
    }
    
    if (overweight >= 4) {
      return "Obese";
    }
    else if (overweight >= 2) {
      return "Overweight";
    }
    else if (overweight >= 1){
      return "Overweight/Fit";
    }
    else if (underweight >= 3){
      return "Extremely Underweight";
    }
    else if (underweight >= 1){
      return "Underweight";
    }
    else {
      return "Fit";
    }  
  }
}
