void drawReport() {
  frameRate(60);
  textAlign(CENTER);
  textSize(20);
  fill(0);
  text("Report: " + C.compare(), width/4, 50);
  
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

void drawDictionary() {
  textAlign(LEFT);
  fill(170, 245, 90);
  noStroke();
  rect(280, 0, width, height);
  fill(0);
  textSize(12);
  text("Body Mass Index (BMI): a measure of body fat", 300, 20);
  textSize(11);
  text("Underweight: BMI <= 18.5", 320, 40);
  text("Normal Weight: 18.6 < BMI <= 24.9", 320, 60);
  text("Overweight: 25 < BMI <= 29.9", 320, 80);
  text("Obese: 30 <= BMI", 320, 100);
  
  textSize(12);
  text("Basal Metabolic Rate (BMR): the number of calories your\nbody burns for basic functions (breathing, digestion, etc.)", 300, 130);
  
  text("Total Body Water: the percentage of water in your body", 300, 180);
  textSize(11);
  textAlign(CENTER);
  text("Ideal", 440, 200);
  textAlign(LEFT);
  text("Male:", 320, 220);
  text("Age 12-18: 52% - 66%", 320, 240);
  text("Age 19-50: 43% - 73%", 320, 260);
  text("Age 51+ : 47% - 67%", 320, 280);
  text("Female:", 450, 220);
  text("Age 12-18: 49% - 63%", 450, 240);
  text("Age 19-50: 41% - 60%", 450, 260);
  text("Age 51+ : 39% - 57%", 450, 280);
  
  textSize(12);
  text("Body Fat Percentage: the percentage of fat in your body", 300, 310);
  textSize(11);
  text("Male:", 320, 330);
  text("Essential Fat: 2% - 5%", 320, 350);
  text("Athletes: 6% - 13%", 320, 370);
  text("Fitness: 14% - 17%", 320, 390);
  text("Acceptable: 18% - 24%", 320, 410);
  text("Obesity: 25% +", 320, 430);
  text("Female:", 450, 330);
  text("Essential Fat: 10% - 13%", 450, 350);
  text("Athletes: 14% - 20%", 450, 370);
  text("Fitness: 21% - 24%", 450, 390);
  text("Acceptable: 25% - 31%", 450, 410);
  text("Obesity: 31% +", 450, 430);
  
  textSize(12);
  text("Lean Body Mass: the mass of your body except for body fat\n(muscles, organs, bones, blood, skin, etc.)", 300, 460);
  stroke(0);
}

void drawFoodExamples() {
  textSize(13);
  text("Examples of Healthy Carbs:\npotatoes, beans, rice, banana, green vegetables . . .", 300, 400);
  text("Examples of Healthy Fats:\nolive oil, nuts, egg, fish, cheese,  . . .", 300, 450);
  text("Examples of Protein:\nfish, chicken, seafood, lean beef, egg, cheese,  . . .", 300, 500);
}
