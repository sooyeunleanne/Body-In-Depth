void loadingPage() { //draw the loading page
  //background
  frameRate(1);
  background(0);
  fill(255);
  rect(25, 25, width-25*2, height-25*2, 25);
  imageMode(CENTER);
  image(logoLarge, width/2, height/4);
  
  fill(0);
  rect(0, 0, width, 25);
  textAlign(CENTER);
  textFont(font1);  
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
  
  textFont(font6);
  text("Disclaimer:", width/2, height/2 + 50);
  text("The calculated results can be inaccurate since everyone's body is different.", width/2, height/2 + 80);
  text("If you want accurate results, visit a local gym/hospital with an InBody machine.", width/2, height/2 + 100);
}

void mainScreenBackground() { //draw the main screen background
  background(25, 30, 120);
  fill(255);
  noStroke();
  rect(15, 15, width-15*2, height-15*2, 15);
}

void drawReport() { //draw the report
  image(logoTransparent, width/2, height/2);
  
  frameRate(60);
  textAlign(LEFT);
  textFont(font3);
  fill(200, 230, 140);
  rect(45, 40, 230, 30, 5);
  fill(0);
  text("Report: " + C.compare(), 50, 60);
  
  textFont(font2);
  text("Body Mass Index: " + C.bmi, 50, 100);
  text("Basal Metabolic Rate: " + C.bmr + " kcals", 50, 150);
  text("Total Body Water: " + C.tbw + " %", 50, 200);
  text("Body Fat Mass: " + C.bfm + " kg", 50, 250);
  text("Body Fat Percentage: " + C.bfp + " %", 50, 300);
  text("Lean Body Mass: " + C.lbm + " kg", 50, 350);
}

void drawSolution() { //draw solution
  textAlign(CENTER);
  textFont(font3);
  fill(0);
  text("D-"+(U.goalDays-1), width*3/4-20, 45);
  
  textFont(font1);
  textSize(15);
  text("Diet Suggestions", width*3/4-20, 63);
  text("Current: "+M.weight+" kg", width*3/4-20, 100);
  text("Goal: "+U.goalWeight+" kg", width*3/4-20, 150);  
  
  if (!unsafe) {
    textAlign(LEFT);
    textFont(font2);
    text("Daily Calories: "+ U.caloriesPerDay + " kcals", width/2+50, 200);
    text("Carbs: "+U.carbCalories[0]+"-"+U.carbCalories[1]+" kcals", width/2+50, 250);
    text("Fats: "+U.fatCalories[0]+"-"+U.fatCalories[1]+" kcals", width/2+50, 300);
    text("Proteins: "+U.proteinCalories[0]+"-"+U.proteinCalories[1]+" kcals", width/2+50, 350);
  }
  else { //if the user's plan is unsafe
    fill(255, 50, 50);
    textAlign(CENTER);
    textFont(font2);
    text("Consult your doctor\nabout your weight loss plan", width/2+125, 275);
    fill(0);
  }
}

void drawGraph() { //draw the graph
  stroke(0);
  strokeWeight(2);
  line(50,400,50,550);
  line(50,550,250,550);
  line(250,547,250,553);
  
  strokeWeight(7);
  textFont(font4);
  textAlign(CENTER);
  text("Total Body Water", C.tbw/100*200+50, 410);
  point(C.tbw/100*200+50, 425); //total body water percentage
  text("Body Fat", C.bfp/100*200+50, 460);
  point(C.bfp/100*200+50, 475); //body fat percentage
  text("Lean Body Mass", C.lbm/M.weight*200+50, 510);
  point(C.lbm/M.weight*200+50, 525); //total lean body mass percentage
  
  text("Percentage (%)", 150, 570);
  text("100", 250, 570);
}

void drawDictionary() { //draw dictionary
  textAlign(LEFT);
  fill(200, 230, 140);
  noStroke();
  rect(280, 5, 310, 590, 20);
  fill(0);
  
  textFont(font4); //explain BMI
  text("Body Mass Index (BMI): a measure of body fat", 295, 30);
  textFont(font5);
  text("Underweight: BMI <= 18.5", 315, 50);
  text("Normal Weight: 18.6 < BMI <= 24.9", 315, 70);
  text("Overweight: 25 < BMI <= 29.9", 315, 90);
  text("Obese: 30 <= BMI", 315, 110);
  
  textFont(font4); //explain BMR
  text("Basal Metabolic Rate (BMR): the number of\ncalories your body burns for basic functions\n(breathing, digestion, etc.)", 300, 140);
  
  text("Total Body Water: the % of water in your body", 295, 210); //explain total body water
  textFont(font5);
  textAlign(CENTER);
  text("Ideal", 435, 230);
  textAlign(LEFT);
  text("Male:", 315, 250);
  text("Age 12-18: 52% - 66%", 315, 270);
  text("Age 19-50: 43% - 73%", 315, 290);
  text("Age 51+ : 47% - 67%", 315, 310);
  text("Female:", 445, 250);
  text("Age 12-18: 49% - 63%", 445, 270);
  text("Age 19-50: 41% - 60%", 445, 290);
  text("Age 51+ : 39% - 57%", 445, 310);
  
  textFont(font4); //explain body fat percentage
  text("Body Fat Percentage: the % of fat in your body", 295, 340);
  textFont(font5);
  text("Male:", 315, 360);
  text("Essential Fat: 2% - 5%", 315, 380);
  text("Athletes: 6% - 13%", 315, 400);
  text("Fitness: 14% - 17%", 315, 420);
  text("Acceptable: 18% - 24%", 315, 440);
  text("Obesity: 25% +", 315, 460);
  text("Female:", 445, 360);
  text("Essential Fat: 10% - 13%", 445, 380);
  text("Athletes: 14% - 20%", 445, 400);
  text("Fitness: 21% - 24%", 445, 420);
  text("Acceptable: 25% - 31%", 445, 440);
  text("Obesity: 31% +", 445, 460);
  
  textFont(font4); //explain lean body mass
  text("Lean Body Mass: the mass of your body\nexcluding body fat (muscles, organs, bones,\nblood, skin, etc.)", 300, 490);
  stroke(0);
}

void drawFoodExamples() {
  //give examples of each macronutrient
  textAlign(LEFT);
  textFont(font4);
  text("Examples of Healthy Carbs:\npotatoes, rice, banana, green vegetables", 295, 410);
  text("Examples of Healthy Fats:\nolive oil, nuts, egg, fish, cheese", 295, 460);
  text("Examples of Protein:\nfish, chicken, seafood, lean beef, egg, cheese", 295, 510);
}
