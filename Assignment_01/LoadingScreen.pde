class LoadingScreen {

  int windowWidth = 1280;
  int windowHeight = 720;
  int buttonWidth = 300;
  int buttonHeight = 100;
  int offset = 0;
  int percent = 0;
  int alpha = 255;


  Boolean start = false;
  Boolean loadingDone = false;
  boolean buttonState = false;


  void draw() {
    pushStyle();
    fill(30, 130, 255);
    if (startScreen(start) == true) {
      loadingBar();
    }
    popStyle();
  }

  //===========================================================================================================================================================================================================//
  Boolean startScreen(boolean start) {

    if (start == false && loadingDone == false) {
      background(255);
      rectMode(CENTER);
      rect(windowWidth/2, windowHeight/2, buttonWidth, buttonHeight);
      pushStyle();
      fill(0);
      textSize(20);
      textAlign(CENTER, CENTER);
      text("DON'T CLICK HERE", windowWidth/2, windowHeight/2);
      popStyle();
    }

    if (start == false) {
      if (mousePressed) {
        if (mouseX < (windowWidth/2 - buttonWidth/2) || mouseX > (windowWidth/2 + buttonWidth/2) || mouseY < (windowHeight/2 - buttonHeight/2) || mouseY > (windowHeight/2 + buttonHeight/2)) {
          start = true;
          buttonState = true;
        }
      }
    }
    return buttonState;
  }


  //===========================================================================================================================================================================================================//
  void loadingBar() {
    pushMatrix();
    background(255);
    frameRate(random(5, 20));
    percent++;
    textSize(30);
    textAlign(CENTER);
    text("Loading ... " + percent + " %", 1280 / 2, 720 / 3);
    rectMode(CORNER);
    rect(1280 / 2 - 100, 720 / 2, percent * 2, 20, 10);
    popMatrix();
    if (percent == 99) {
      delay(2000);
      loadingDone = true;
      buttonState =false;
      fill(255);
      rect(0, 0, width, height);
    }
  }
}
