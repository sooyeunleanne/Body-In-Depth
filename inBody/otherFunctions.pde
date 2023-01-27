void screenshot() { //screenshot function
  try {
    screenshot = new PImage(new Robot().createScreenCapture(new Rectangle(350, 100, 600, 600)));
    String day = "";
    String month = "";
    if (day()<10) day = "0"+str(day());
    else day = str(day());
    if (month()<10) month = "0"+str(month());
    else month = str(month());
    day = "10";
    screenshot.save(dataPath("records") + "/"+month+"."+day+"."+year()+".jpg");
  } catch (AWTException e) { }
}

float round2DP(float f) { //rounding to two decimals
  float roundedValue = float(round(f*100))/100;
  return roundedValue;
}
