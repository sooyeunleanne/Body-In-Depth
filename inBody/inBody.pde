import g4p_controls.*;

Measurements M;
Calculations C;
User U;
int loadingN;
boolean calculated = false;
boolean dictionaryOpen = false;

void setup() {
  M = new Measurements(0, 0, 0, 0, 0, 0, 0);
  C = new Calculations(M, "female");
  C.computeInBody();
  C.compare();
  U = new User(M, C, 47.0, 100);
  U.getAdvice();
  
  size(600, 600);
  background(255);
  
  createGUI();
  dictionaryButton.setVisible(false);
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
    dictionaryButton.setVisible(true);
    if (dictionaryOpen) {
      drawDictionary();
    }
    else {
      drawSolution();
      drawFoodExamples();
    }
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
  text("If you want a higher accuracy, visit a local gym/hospital with an InBody machine.", width/2, height/2 + 100);
}

float round2DP(float f) {
  float roundedValue = float(round(f*100))/100;
  return roundedValue;
}
