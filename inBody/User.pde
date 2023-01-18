class User {
  Measurements m;
  Calculations c;
  float goalWeight;
  int goalDays;
  float diffWeight;
  float caloriesPerDay;
  float[] carbCalories = new float[2];
  float[] fatCalories = new float[2];
  float[] proteinCalories = new float[2];
  
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
      this.caloriesPerDay = this.c.caloricNeeds - 500*weightLossPerWeek/5;
    }
  }
  
  void getAdvice() {
    println("Consume around", this.caloriesPerDay, "calories per day for", this.goalDays, "days");
    
    this.carbCalories[0] = this.caloriesPerDay*0.45;
    this.carbCalories[1] = this.caloriesPerDay*0.65;
    
    this.fatCalories[0] = this.caloriesPerDay*0.25;
    this.fatCalories[1] = this.caloriesPerDay*0.35;
    
    this.proteinCalories[0] = this.caloriesPerDay*0.10;
    this.proteinCalories[1] = this.caloriesPerDay*0.30;
    
    println("Suggested carbohydrate consumption:", this.carbCalories[0], "-", this.carbCalories[1], "calories");
    println("Suggested fat consumption:", this.fatCalories[0], "-", this.fatCalories[1], "calories");
    println("Suggested protein consumption:", this.proteinCalories[0], "-", this.proteinCalories[1], "calories");

  }
}
