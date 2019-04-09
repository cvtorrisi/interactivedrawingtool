class Button {

  int positionX;
  int positionY;
  int buttonW;
  int buttonH;
  
  String buttonText;

  Boolean isActive = false;

  color colour;

  //===========================================================================================================================================================================================================//
  Button(int x, int y, int w, int h , String text) {
    positionX = x;
    positionY = y;
    buttonW = w;
    buttonH = h;
    buttonText = text;
  }

  //===========================================================================================================================================================================================================//
  void draw() {
    buttonUpdate();
    fill(colour);
    rect(positionX, positionY, buttonW, buttonH);
    pushStyle();
    textAlign(CENTER, CENTER);
    fill(0);
    textSize(12);
    text(buttonText, positionX + (buttonW/2), positionY + (buttonH/2)-1);
    popStyle();
  }

  //===========================================================================================================================================================================================================//
  Boolean checkIfPressed() {
    if ((mouseX > positionX) && (mouseX < positionX + buttonW)) {
      if ((mouseY > positionY) && (mouseY < positionY + buttonH)) {
        if (mousePressed ) {
          isActive = true;
        } 
        else {
          isActive = false;
        }
      }
    }


    return isActive;
  }


  //===========================================================================================================================================================================================================//
  void buttonUpdate() {
    if (checkIfPressed() == true) {
      colour = color(30, 255, 30);
    } else {
      colour = color(30, 170, 255);
    }
  }
}
