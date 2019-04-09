class Brush {


  int brushType;
  int alpha1 = 0;
  int strokeWeight = 1;
  int step = 2;
  int splatRadius = 10;
  int radius = 10;
  int count = 10;
  int inputAngle = 20;
  int sin = 20;
  int cos = 20;
  int alpha2 = 255;

  float randomX;
  float randomY;
  float movementX;
  float movementY;
  float xPoint;
  float yPoint;
  float angle;

  float X1;
  float Y1;
  float X2;
  float Y2;
  float increment;
  float a;


  //===========================================================================================================================================================================================================//
  void draw() {
    if (brushType == 1) {
      simpleLine();
    }
    if (brushType == 2) {
      splatter();
    }
    if (brushType == 3) {
      spiral();
    }
    if (brushType == 4) {
      growingRoots();
    }
  }


  //===========================================================================================================================================================================================================//
  void splatter() {
    splatterUpdate();
    if (mousePressed) {      
      paintArea.fill(red, green, blue);
      paintArea.noStroke();
      paintArea.ellipse(mouseX + xPoint, mouseY + yPoint, radius, radius);
    }
  }

  void splatterUpdate() {
    randomX = random(splatRadius);
    randomY = random(splatRadius);
    angle = random(360);

    xPoint = randomX*cos(radians(angle));
    yPoint = randomX*sin(radians(angle));
  }


  //===========================================================================================================================================================================================================//
  void spiral() {
    while (radius > 1) {
      spiralUpdate();
      paintArea.fill(red, green, blue, alpha1);
      paintArea.stroke(0, alpha1);
      paintArea.ellipse(mouseX + xPoint, mouseY + yPoint, radius, radius);
    }
  }

  void spiralUpdate() {
    radius--;
    movementX = movementX + step;
    movementY = movementY + step;
    alpha1 += (255/count);
    alpha2 -= (255/count);

    angle += inputAngle;

    xPoint = movementX * cos(radians(angle));
    yPoint = movementX * sin(radians(angle));
  }

  void spiralReset() {
    radius = count;
    movementX = 0;
    movementY = 0;
    alpha1 = 0;
    alpha2 = 255;
  }


  //===========================================================================================================================================================================================================//
  void simpleLine() {
    if (mousePressed) {
      paintArea.smooth();
      paintArea.stroke(red, green, blue);
      paintArea.strokeWeight(strokeWeight);
      paintArea.line(pmouseX, pmouseY, mouseX, mouseY);
    }
  }


  //===========================================================================================================================================================================================================//
  void growingRoots() {
    if (red == 0 && green == 0 && blue ==0) {
      paintArea.stroke(255);
    } else {
      paintArea.stroke(0);
    }
    int size = count;
    if (mousePressed) {
      for (int i=0; i<count; i+=step) {
        size-=step;
        increment = TWO_PI/inputAngle;
        X1 = i;
        Y1 = sin(a) * sin;
        X2 = cos(a) * cos;
        Y2 = i;
        a = a + increment;
        paintArea.fill(red, green, blue);
        paintArea.ellipse(mouseX + X1, mouseY + Y1, size, size);
        paintArea.ellipse(mouseX + X2, mouseY + Y2, size, size);
        paintArea.ellipse(mouseX - X1, mouseY - Y1, size, size);
        paintArea.ellipse(mouseX - X2, mouseY - Y2, size, size);
      }
    }
  }


  //===========================================================================================================================================================================================================//
  void setBrush(int b) {
    brushType = b;
  }
}
