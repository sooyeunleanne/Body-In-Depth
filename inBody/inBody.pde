void setup() {
  String gender = "female";
  float height = 163;
  float weight = 52;
  float neck = 50;
  float waist = 80;
  float hip = 100;
  float age = 17;
  float activityFactor = 1.2;
  
  float bmi, bmr, bfp, bfw, lbm, tbw;
  float caloricNeeds;
  float carb, protein, fat;
  
  int overweight = 0;
  int underweight = 0;
  
  //computations
  bmi = weight/pow(height/100, 2);
  if (bmi > 25) {
    overweight += 1;
  }
  else if (bmi < 18.5) {
    underweight += 1;
  }
  
  if (gender.equals("male")) {
    bmr = 88.362 + 13.397*weight + 4.799*height - 5.677*age;
    bfp = 495/(1.0324 - 0.19077*log(waist-neck)/log(10) + 0.15456*log(height)/log(10)) - 450;
    if (bfp > 25) {
      overweight += 1;
    }
    else if (bfp < 14) {
      underweight += 1;
    }
    bfw = bfp*weight/100;
    lbm = weight - bfw;
    tbw = 2.447 - 0.09156*age + 0.1074*height + 0.3362*weight;
  }
  else {
    bmr = 447.593 + 9.247*weight + 3.098*height - 4.330*age;
    bfp = 495/(1.29579 - 0.35004*log(waist+hip-neck)/log(10) + 0.221*log(height)/log(10)) - 450;
    if (bfp > 32) {
      overweight += 1;
    }
    else if (bfp < 21) {
      underweight += 1;
    }
    bfw = bfp*weight/100;
    lbm = weight - bfw;
    tbw = -2.097 + 0.1069*height + 0.2466*weight;
  }
  caloricNeeds = bmr * activityFactor;
  
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
