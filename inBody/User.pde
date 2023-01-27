class User {
  Measurements m;
  Calculations c;
  float goalWeight;
  int goalDays;
  float diffWeight;
  int caloriesPerDay;
  int[] carbCalories = new int[2];
  int[] fatCalories = new int[2];
  int[] proteinCalories = new int[2];
  
  User(Measurements mInput, Calculations cInput, float w, int d) {
    this.m = mInput;
    this.c = cInput;
    this.goalWeight = w;
    this.goalDays = d;
  }
  
  void checkSafety() { //check if the user's plan is safe
    this.diffWeight = this.m.weight - this.goalWeight;
    float weightLossPerWeek = this.diffWeight/this.goalDays*7;
    float goalBMI = this.goalWeight/pow(this.m.height/100, 2);
    
    if (Math.abs(weightLossPerWeek) > 1.5 || goalBMI <= 16.5 || goalBMI >= 26.5) {
      unsafe = true;
    }
    else {
      unsafe = false;
      this.caloriesPerDay = round(this.c.caloricNeeds - 500*weightLossPerWeek/5);
    }
  }
  
  void getAdvice() { //get the specific range of caloric needs for each macronutrient
    this.carbCalories[0] = round(this.caloriesPerDay*0.45);
    this.carbCalories[1] = round(this.caloriesPerDay*0.65);
    
    this.fatCalories[0] = round(this.caloriesPerDay*0.25);
    this.fatCalories[1] = round(this.caloriesPerDay*0.35);
    
    this.proteinCalories[0] = round(this.caloriesPerDay*0.10);
    this.proteinCalories[1] = round(this.caloriesPerDay*0.30);
  }
}
