//Leanne Kim - CS Final Project: InBody

import g4p_controls.*;
import java.awt.*;

Measurements M;
Calculations C;
User U;
int loadingN;
boolean unsafe = false;
boolean calculated = false;
boolean dictionaryOpen = false;
boolean unitConverterOpen = false;
PFont font1, font2, font3, font4, font5, font6;
PImage logoLarge, logoTransparent;
PImage screenshot;

void setup() {
  //loading fonts
  font1 = createFont("MontserratMediumItalic.ttf", 18);
  font2 = createFont("MontserratMedium.ttf", 13);
  font3 = createFont("MontserratExtraboldItalic.ttf", 17);
  font4 = createFont("MontserratMedium.ttf", 12);
  font5 = createFont("MontserratLight.ttf", 11);
  font6 = createFont("MontserratLight.ttf", 13);
  
  //loading logo images
  logoLarge = loadImage("logoLarge.png");
  logoLarge.resize(300,300);
  logoTransparent = loadImage("logoTransparent.png");
  
  //screen setting
  size(600, 600);
  surface.setLocation(350, 100);
  background(255);
  
  createGUI();
  dictionaryButton.setVisible(false);
  unitConverter.setVisible(false);
  screenshotButton.setVisible(false);
  loadingN = 1;
  
  M = new Measurements(0, 0, 0, 0, 0, 0, 0);
  C = new Calculations(M, "female");
  C.computeInBody();
  C.compare();
  U = new User(M, C, 0, 0);
  U.getAdvice(); 
} 

void draw() {
  if (!calculated) { //before the user inputs are received
    loadingPage();
  }
  else { //after the InBody measures are calculated
    mainScreenBackground();
    drawReport();
    drawGraph();
    dictionaryButton.setVisible(true);
    if (dictionaryOpen) { //if the user opens the dictionary
      drawDictionary();
      screenshotButton.setVisible(false);
    }
    else { //when the dictionary is closed
      drawSolution();
      drawFoodExamples();
      screenshotButton.setVisible(true);
    }
  }
}
