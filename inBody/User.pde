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
  
  void compare() {
    this.diffWeight = this.m.weight - this.goalWeight;
    float weightLossPerWeek = this.diffWeight/this.goalDays*7;
    if (Math.abs(weightLossPerWeek) >= 1) {
      println("Consult your doctor for your weight loss plan");
    }
    else {
      this.caloriesPerDay = round(this.c.caloricNeeds - 500*weightLossPerWeek/5);
    }
  }
  
  void getAdvice() {    
    this.carbCalories[0] = round(this.caloriesPerDay*0.45);
    this.carbCalories[1] = round(this.caloriesPerDay*0.65);
    
    this.fatCalories[0] = round(this.caloriesPerDay*0.25);
    this.fatCalories[1] = round(this.caloriesPerDay*0.35);
    
    this.proteinCalories[0] = round(this.caloriesPerDay*0.10);
    this.proteinCalories[1] = round(this.caloriesPerDay*0.30);
  }
}
