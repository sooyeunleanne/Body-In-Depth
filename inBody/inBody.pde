import g4p_controls.*;

Measurements M;
Calculations C;
User U;
int loadingN;
boolean calculated = false;

void setup() {
  M = new Measurements(0, 0, 0, 0, 0, 0, 0);
  C = new Calculations(M, "female");
  C.computeInBody();
  U = new User(M, C, 47.0, 100);
  U.compare();
  U.getAdvice();
  
  size(600, 600);
  background(255);
  
  createGUI();
  
  loadingN = 1;
} 

void draw() {
  if (!calculated) {
    loadingPage();
  }
  else {
    background(255);
    drawReport();
    drawGraph();
    drawSolution();
  }
}

void loadingPage() {
  frameRate(1);
  background(255);
  textAlign(CENTER);
  textSize(25);
  fill(0);
  if (loadingN%3 == 0) {
    text("Loading . . . ", width/2, height/2);
    loadingN = 0;
  }
  else if (loadingN%3 == 1) {
    text("Loading . ", width/2, height/2);
  }
  else {
    text("Loading . . ", width/2, height/2);
  }
  loadingN += 1;
  
  textSize(15);
  text("Disclaimer:", width/2, height/2 + 50);
  text("The calculated results might be inaccurate since everyone's body is different.", width/2, height/2 + 80);
  text("If you want higher accuracy, visit a local gym/hospital with an InBody machine.", width/2, height/2 + 100);
  
  
}

void drawReport() {
  frameRate(60);
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

void drawGraph() {
  strokeWeight(2);
  line(50,400,50,550);
  line(50,550,250,550);
  
  strokeWeight(7);
  textSize(12);
  textAlign(CENTER);
  text("Total Body Water", C.tbw/100*200+50, 410);
  point(C.tbw/100*200+50, 425); //total body water percentage
  text("Body Fat", C.bfp/100*200+50, 460);
  point(C.bfp/100*200+50, 475); //body fat percentage
  text("Lean Body Mass", C.lbm/M.weight*200+50, 510);
  point(C.lbm/M.weight*200+50, 525); //total lean body mass percentage
  
  text("Percentage (%)", 220, 570);
}

float round2DP(float f) {
  float roundedValue = float(round(f*100))/100;
  return roundedValue;
}
