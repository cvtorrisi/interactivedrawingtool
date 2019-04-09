class ToggleButton {

  int buttonW;
  int buttonH;
  int positionX;
  int positionY;
  
  String toggleText;

  Boolean isActive = false;
  Boolean isReady = true;
  
  color colour;

  //===========================================================================================================================================================================================================//
  ToggleButton(int x, int y, int w, int h, String text) {
    positionX = x;
    positionY = y;
    buttonW = w;
    buttonH = h;
    toggleText = text;
  }

  //===========================================================================================================================================================================================================//
  void draw() {
    toggleUpdate();
    fill(colour);
    rect(positionX, positionY, buttonW, buttonH);
    pushStyle();
    textAlign(CENTER, CENTER);
    fill(0);
    textSize(12);
    text(toggleText, positionX + (buttonW/2), positionY + (buttonH/2)-1);
    popStyle();
  }

  //===========================================================================================================================================================================================================//
  Boolean checkIfPressed() {
    if ((mouseX > positionX) && (mouseX < positionX + buttonW)) {
      if ((mouseY > positionY) && (mouseY < positionY + buttonH)) {
        if (mousePressed && isReady) {
          isActive = !isActive;
          isReady = false;
        }
      }
    }
    if (!mousePressed) {
      isReady = true;
    }
    return isActive;
  }

  //===========================================================================================================================================================================================================//
  void toggleUpdate() {
    if (checkIfPressed()) {
      colour = color(30, 255, 30);
    } else {
      colour = color(30, 170, 255);
    }
  }
}
