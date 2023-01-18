Measurements M;
Calculations C;
User U;
void setup() {
  M = new Measurements(163.0, 52.0, 50.0, 80.0, 100.0, 17.0, 1.2);
  C = new Calculations(M, "female");
  C.computeInBody();
  U = new User(M, C, 47.0, 100);
  U.compare();
  U.getAdvice();
  
  size(600, 600);
  background(255);
} 

void draw() {
  background(255);
  
  drawReport();
  drawSolution();
}

void drawReport() {
  textAlign(CENTER);
  textSize(20);
  fill(0);
  text("Report", width/4, 50);
  
  textAlign(LEFT);
  textSize(15);
  text("Body Mass Index: " + C.bmi, 50, 100);
  text("Basal Metabolic Rate: " + C.bmr + " cals", 50, 150);
  text("Total Body Water: " + C.tbw + " %", 50, 200);
  text("Body Fat Mass: " + C.bfm + " kg", 50, 250);
  text("Body Fat Percentage: " + C.bfp + " %", 50, 300);
  text("Lean Body Mass: " + C.lbm + " kg", 50, 350);
}

void drawSolution() {
  textAlign(CENTER);
  textSize(20);
  fill(0);
  text("D-"+(U.goalDays-1), width*3/4, 45);
  textSize(15);
  text("Diet Suggestions", width*3/4, 63);
  text("Current: "+M.weight+" kg", width*3/4, 100);
  text("Goal: "+U.goalWeight+" kg", width*3/4, 150);  
  
  textAlign(LEFT);
  textSize(15);
  text("Daily Calories: "+ U.caloriesPerDay + " cals", width/2+50, 200);
  text("Carbs: "+U.carbCalories[0]+"-"+U.carbCalories[1]+" cals", width/2+50, 250);
  text("Fats: "+U.fatCalories[0]+"-"+U.fatCalories[1]+" cals", width/2+50, 300);
  text("Proteins: "+U.proteinCalories[0]+"-"+U.proteinCalories[1]+" cals", width/2+50, 350);
}
