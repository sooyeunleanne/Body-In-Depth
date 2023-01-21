/* =========================================================
 * ====                   WARNING                        ===
 * =========================================================
 * The code in this tab has been generated from the GUI form
 * designer and care should be taken when editing this file.
 * Only add/edit code inside the event handlers i.e. only
 * use lines between the matching comment tags. e.g.

 void myBtnEvents(GButton button) { //_CODE_:button1:12356:
     // It is safe to enter your event code here  
 } //_CODE_:button1:12356:
 
 * Do not rename this tab!
 * =========================================================
 */

public void dictionaryButton_click(GButton source, GEvent event) { //_CODE_:dictionaryButton:202076:
  if (dictionaryOpen == true) {
    dictionaryButton.setText("Open Dictionary");
    dictionaryOpen = false;
  }
  else {
    dictionaryButton.setText("Close Dictionary");
    dictionaryOpen = true;
  }
} //_CODE_:dictionaryButton:202076:

synchronized public void input_draw(PApplet appc, GWinData data) { //_CODE_:input:675210:
  appc.background(230);
} //_CODE_:input:675210:

public void activityInput_change(GSlider source, GEvent event) { //_CODE_:activityInput:654115:
} //_CODE_:activityInput:654115:

public void heightInput_change(GTextField source, GEvent event) { //_CODE_:heightInput:636322:
} //_CODE_:heightInput:636322:

public void weightInput_change(GTextField source, GEvent event) { //_CODE_:weightInput:828059:
} //_CODE_:weightInput:828059:

public void neckInput_change(GTextField source, GEvent event) { //_CODE_:neckInput:309339:
} //_CODE_:neckInput:309339:

public void waistInput_change(GTextField source, GEvent event) { //_CODE_:waistInput:573522:
} //_CODE_:waistInput:573522:

public void hipInput_change(GTextField source, GEvent event) { //_CODE_:hipInput:432241:
} //_CODE_:hipInput:432241:

public void ageInput_change(GTextField source, GEvent event) { //_CODE_:ageInput:402824:
} //_CODE_:ageInput:402824:

public void goalWeightInput_change(GTextField source, GEvent event) { //_CODE_:goalWeightInput:883329:
} //_CODE_:goalWeightInput:883329:

public void goalDaysInput_change(GTextField source, GEvent event) { //_CODE_:goalDaysInput:224668:
} //_CODE_:goalDaysInput:224668:

public void maleButton_click(GButton source, GEvent event) { //_CODE_:maleButton:636687:
  float hValue = float(heightInput.getText());
  float wValue = float(weightInput.getText());
  float neckValue = float(neckInput.getText());
  float waistValue = float(waistInput.getText());
  float hipValue = float(hipInput.getText());
  float ageValue = float(ageInput.getText());
  float activityFactorValue = activityInput.getValueF();
  
  M = new Measurements(hValue, wValue, neckValue, waistValue, hipValue, ageValue, activityFactorValue);
  C = new Calculations(M, "male");
  C.computeInBody();
  
  float goalWeightValue = float(goalWeightInput.getText());
  int goalDaysValue = int(goalDaysInput.getText());
  U = new User(M, C, goalWeightValue, goalDaysValue);
  U.compare();
  U.getAdvice();
  
  calculated = true;
} //_CODE_:maleButton:636687:

public void femaleButton_click(GButton source, GEvent event) { //_CODE_:femaleButton:617635:
  float hValue = float(heightInput.getText());
  float wValue = float(weightInput.getText());
  float neckValue = float(neckInput.getText());
  float waistValue = float(waistInput.getText());
  float hipValue = float(hipInput.getText());
  float ageValue = float(ageInput.getText());
  float activityFactorValue = activityInput.getValueF();
  
  M = new Measurements(hValue, wValue, neckValue, waistValue, hipValue, ageValue, activityFactorValue);
  C = new Calculations(M, "female");
  C.computeInBody();
  
  float goalWeightValue = float(goalWeightInput.getText());
  int goalDaysValue = int(goalDaysInput.getText());
  U = new User(M, C, goalWeightValue, goalDaysValue);
  U.compare();
  U.getAdvice();
  
  calculated = true;
} //_CODE_:femaleButton:617635:

public void unitConverterButton_click(GButton source, GEvent event) { //_CODE_:unitConverterButton:650238:
  unitConverter = GWindow.getWindow(this, "Convert Units", 0, 0, 200, 150, JAVA2D);
  unitConverter.noLoop();
  unitConverter.setActionOnClose(G4P.KEEP_OPEN);
  unitConverter.addDrawHandler(this, "unitConverter_draw");
  unitConverterLabel = new GLabel(unitConverter, 50, 10, 100, 20);
  unitConverterLabel.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  unitConverterLabel.setText("Convert Units");
  unitConverterLabel.setOpaque(false);
  kgInput = new GTextField(unitConverter, 16, 40, 50, 30, G4P.SCROLLBARS_NONE);
  kgInput.setOpaque(true);
  kgInput.addEventHandler(this, "kgInput_change");
  kgLabel = new GLabel(unitConverter, 66, 45, 30, 20);
  kgLabel.setText("kg = ");
  kgLabel.setOpaque(false);
  lbInput = new GTextField(unitConverter, 100, 40, 50, 30, G4P.SCROLLBARS_NONE);
  lbInput.setOpaque(true);
  lbInput.addEventHandler(this, "lbInput_change");
  lbLabel = new GLabel(unitConverter, 150, 45, 30, 20);
  lbLabel.setText("lbs");
  lbLabel.setOpaque(false);
  cmInput = new GTextField(unitConverter, 15, 75, 50, 30, G4P.SCROLLBARS_NONE);
  cmInput.setOpaque(true);
  cmInput.addEventHandler(this, "cmInput_change");
  cmLabel = new GLabel(unitConverter, 65, 78, 40, 20);
  cmLabel.setText("cm =");
  cmLabel.setOpaque(false);
  inchInput = new GTextField(unitConverter, 135, 75, 30, 30, G4P.SCROLLBARS_NONE);
  inchInput.setOpaque(true);
  inchInput.addEventHandler(this, "inchInput_change");
  ftLabel = new GLabel(unitConverter, 123, 80, 20, 20);
  ftLabel.setText("ft");
  ftLabel.setOpaque(false);
  ftInput = new GTextField(unitConverter, 100, 75, 20, 30, G4P.SCROLLBARS_NONE);
  ftInput.setOpaque(true);
  ftInput.addEventHandler(this, "ftInput_change");
  inchLabel = new GLabel(unitConverter, 165, 80, 35, 20);
  inchLabel.setText("inch");
  inchLabel.setOpaque(false);
  unitConverter.loop();
} //_CODE_:unitConverterButton:650238:

synchronized public void unitConverter_draw(PApplet appc, GWinData data) { //_CODE_:unitConverter:993792:
  appc.background(230);
} //_CODE_:unitConverter:993792:

public void kgInput_change(GTextField source, GEvent event) { //_CODE_:kgInput:410301:
  float kgValue = float(kgInput.getText());
  lbInput.setText(str(round2DP(kgValue*2.205)));
} //_CODE_:kgInput:410301:

public void lbInput_change(GTextField source, GEvent event) { //_CODE_:lbInput:289306:
  float lbValue = float(lbInput.getText());
  kgInput.setText(str(round2DP(lbValue/2.205)));
} //_CODE_:lbInput:289306:

public void cmInput_change(GTextField source, GEvent event) { //_CODE_:cmInput:366363:
  float cmValue = float(cmInput.getText());
  ftInput.setText(str(int(cmValue/30.48)));
  float inchValue = (cmValue - int(ftInput.getText())*30.48)/2.54;
  inchInput.setText(str(round2DP(inchValue)));
} //_CODE_:cmInput:366363:

public void inchInput_change(GTextField source, GEvent event) { //_CODE_:inchInput:926775:
  float inchValue = float(inchInput.getText());
  int ftValue = int(ftInput.getText());
  float cmValue = ftValue*30.48 + inchValue*2.54;
  cmInput.setText(str(round2DP(cmValue)));
} //_CODE_:inchInput:926775:

public void ftInput_change(GTextField source, GEvent event) { //_CODE_:ftInput:627180:
  float inchValue = float(inchInput.getText());
  int ftValue = int(ftInput.getText());
  float cmValue = ftValue*30.48 + inchValue*2.54;
  cmInput.setText(str(round2DP(cmValue)));
} //_CODE_:ftInput:627180:



// Create all the GUI controls. 
// autogenerated do not edit
public void createGUI(){
  G4P.messagesEnabled(false);
  G4P.setGlobalColorScheme(GCScheme.BLUE_SCHEME);
  G4P.setMouseOverEnabled(false);
  surface.setTitle("Sketch Window");
  dictionaryButton = new GButton(this, 480, 550, 100, 30);
  dictionaryButton.setText("Open Dictionary");
  dictionaryButton.setLocalColorScheme(GCScheme.GREEN_SCHEME);
  dictionaryButton.addEventHandler(this, "dictionaryButton_click");
  input = GWindow.getWindow(this, "Measurements and Goals", 0, 0, 400, 600, JAVA2D);
  input.noLoop();
  input.setActionOnClose(G4P.KEEP_OPEN);
  input.addDrawHandler(this, "input_draw");
  activityInput = new GSlider(input, 150, 300, 150, 50, 10.0);
  activityInput.setShowValue(true);
  activityInput.setShowLimits(true);
  activityInput.setLimits(1.5, 1.0, 2.0);
  activityInput.setNbrTicks(5);
  activityInput.setStickToTicks(true);
  activityInput.setShowTicks(true);
  activityInput.setNumberFormat(G4P.DECIMAL, 2);
  activityInput.setOpaque(false);
  activityInput.addEventHandler(this, "activityInput_change");
  heightLabel = new GLabel(input, 50, 55, 80, 20);
  heightLabel.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  heightLabel.setText("Height");
  heightLabel.setOpaque(false);
  weightLabel = new GLabel(input, 50, 95, 80, 20);
  weightLabel.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  weightLabel.setText("Weight");
  weightLabel.setOpaque(false);
  neckLabel = new GLabel(input, 50, 135, 80, 20);
  neckLabel.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  neckLabel.setText("Neck");
  neckLabel.setOpaque(false);
  waistLabel = new GLabel(input, 50, 175, 80, 20);
  waistLabel.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  waistLabel.setText("Waist");
  waistLabel.setOpaque(false);
  hipLabel = new GLabel(input, 50, 215, 80, 20);
  hipLabel.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  hipLabel.setText("Hip");
  hipLabel.setOpaque(false);
  ageLabel = new GLabel(input, 50, 255, 80, 20);
  ageLabel.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  ageLabel.setText("Age");
  ageLabel.setOpaque(false);
  activityLabel1 = new GLabel(input, 50, 305, 80, 20);
  activityLabel1.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  activityLabel1.setText("Activity Level");
  activityLabel1.setOpaque(false);
  activityLabel2 = new GLabel(input, 40, 325, 100, 20);
  activityLabel2.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  activityLabel2.setText("1 = not active");
  activityLabel2.setOpaque(false);
  activityLabel3 = new GLabel(input, 40, 345, 100, 20);
  activityLabel3.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  activityLabel3.setText("2 = very active");
  activityLabel3.setOpaque(false);
  currentLabel = new GLabel(input, 100, 18, 200, 20);
  currentLabel.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  currentLabel.setText("Current Measurements");
  currentLabel.setOpaque(false);
  heightLabel2 = new GLabel(input, 300, 55, 80, 20);
  heightLabel2.setText("cm");
  heightLabel2.setOpaque(false);
  weightLabel2 = new GLabel(input, 300, 95, 80, 20);
  weightLabel2.setText("kg");
  weightLabel2.setOpaque(false);
  neckLabel2 = new GLabel(input, 300, 135, 80, 20);
  neckLabel2.setText("cm");
  neckLabel2.setOpaque(false);
  waistLabel2 = new GLabel(input, 300, 175, 80, 20);
  waistLabel2.setText("cm");
  waistLabel2.setOpaque(false);
  hipLabel2 = new GLabel(input, 300, 215, 80, 20);
  hipLabel2.setText("cm");
  hipLabel2.setOpaque(false);
  ageLabel2 = new GLabel(input, 301, 255, 80, 20);
  ageLabel2.setText("years");
  ageLabel2.setOpaque(false);
  goalLabel = new GLabel(input, 100, 390, 200, 20);
  goalLabel.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  goalLabel.setText("Goals");
  goalLabel.setOpaque(false);
  goalWeightLabel = new GLabel(input, 50, 425, 80, 20);
  goalWeightLabel.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  goalWeightLabel.setText("Goal Weight");
  goalWeightLabel.setOpaque(false);
  goalDaysLabel = new GLabel(input, 50, 465, 95, 20);
  goalDaysLabel.setTextAlign(GAlign.CENTER, GAlign.MIDDLE);
  goalDaysLabel.setText("Number of Days");
  goalDaysLabel.setOpaque(false);
  goalWeightLabel2 = new GLabel(input, 300, 425, 80, 20);
  goalWeightLabel2.setText("kg");
  goalWeightLabel2.setOpaque(false);
  goalDaysLabel2 = new GLabel(input, 300, 465, 80, 20);
  goalDaysLabel2.setText("days");
  goalDaysLabel2.setOpaque(false);
  heightInput = new GTextField(input, 150, 50, 150, 30, G4P.SCROLLBARS_NONE);
  heightInput.setOpaque(true);
  heightInput.addEventHandler(this, "heightInput_change");
  weightInput = new GTextField(input, 150, 90, 150, 30, G4P.SCROLLBARS_NONE);
  weightInput.setOpaque(true);
  weightInput.addEventHandler(this, "weightInput_change");
  neckInput = new GTextField(input, 150, 130, 150, 30, G4P.SCROLLBARS_NONE);
  neckInput.setOpaque(true);
  neckInput.addEventHandler(this, "neckInput_change");
  waistInput = new GTextField(input, 150, 170, 150, 30, G4P.SCROLLBARS_NONE);
  waistInput.setOpaque(true);
  waistInput.addEventHandler(this, "waistInput_change");
  hipInput = new GTextField(input, 150, 210, 150, 30, G4P.SCROLLBARS_NONE);
  hipInput.setOpaque(true);
  hipInput.addEventHandler(this, "hipInput_change");
  ageInput = new GTextField(input, 150, 250, 150, 30, G4P.SCROLLBARS_NONE);
  ageInput.setOpaque(true);
  ageInput.addEventHandler(this, "ageInput_change");
  goalWeightInput = new GTextField(input, 150, 420, 150, 30, G4P.SCROLLBARS_NONE);
  goalWeightInput.setOpaque(true);
  goalWeightInput.addEventHandler(this, "goalWeightInput_change");
  goalDaysInput = new GTextField(input, 150, 460, 150, 30, G4P.SCROLLBARS_NONE);
  goalDaysInput.setOpaque(true);
  goalDaysInput.addEventHandler(this, "goalDaysInput_change");
  maleButton = new GButton(input, 100, 520, 90, 30);
  maleButton.setText("Male");
  maleButton.setLocalColorScheme(GCScheme.CYAN_SCHEME);
  maleButton.addEventHandler(this, "maleButton_click");
  femaleButton = new GButton(input, 210, 520, 90, 30);
  femaleButton.setText("Female");
  femaleButton.setLocalColorScheme(GCScheme.CYAN_SCHEME);
  femaleButton.addEventHandler(this, "femaleButton_click");
  unitConverterButton = new GButton(input, 240, 560, 150, 30);
  unitConverterButton.setText("Open Unit Converter");
  unitConverterButton.setLocalColorScheme(GCScheme.YELLOW_SCHEME);
  unitConverterButton.addEventHandler(this, "unitConverterButton_click");
  input.loop();
}

// Variable declarations 
// autogenerated do not edit
GButton dictionaryButton; 
GWindow input;
GSlider activityInput; 
GLabel heightLabel; 
GLabel weightLabel; 
GLabel neckLabel; 
GLabel waistLabel; 
GLabel hipLabel; 
GLabel ageLabel; 
GLabel activityLabel1; 
GLabel activityLabel2; 
GLabel activityLabel3; 
GLabel currentLabel; 
GLabel heightLabel2; 
GLabel weightLabel2; 
GLabel neckLabel2; 
GLabel waistLabel2; 
GLabel hipLabel2; 
GLabel ageLabel2; 
GLabel goalLabel; 
GLabel goalWeightLabel; 
GLabel goalDaysLabel; 
GLabel goalWeightLabel2; 
GLabel goalDaysLabel2; 
GTextField heightInput; 
GTextField weightInput; 
GTextField neckInput; 
GTextField waistInput; 
GTextField hipInput; 
GTextField ageInput; 
GTextField goalWeightInput; 
GTextField goalDaysInput; 
GButton maleButton; 
GButton femaleButton; 
GButton unitConverterButton; 
GWindow unitConverter;
GLabel unitConverterLabel; 
GTextField kgInput; 
GLabel kgLabel; 
GTextField lbInput; 
GLabel lbLabel; 
GTextField cmInput; 
GLabel cmLabel; 
GTextField inchInput; 
GLabel ftLabel; 
GTextField ftInput; 
GLabel inchLabel; 
