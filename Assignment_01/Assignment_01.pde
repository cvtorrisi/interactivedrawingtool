// Import ControlP5 for Text Boxes
import controlP5.*;
ControlP5 cp5;

// Set up all variable and obojects
Brush brush;

Button clearButton;
Button saveButton;

LoadingScreen loadingScreen;

TextBox inputRed;
TextBox inputBlue;
TextBox inputGreen;
TextBox inputRadius;
TextBox inputAngle;
TextBox inputCount;
TextBox inputSplatter;
TextBox inputStroke;
TextBox inputStep;
TextBox inputSin;
TextBox inputCos;

ToggleButton lineToggle;
ToggleButton splatterToggle;
ToggleButton spiralToggle;
ToggleButton rootsToggle;



// Set as 'final' because these variables will not change

final int UIHeight = 150;
final int rowHeight1 = 590;
final int rowHeight2 = 640;
final int rowHeight3 = 690;

int fontSize = 15;
int saveCount;


// Set as floats to gain seperate variables from the get() function
float red;
float green;
float blue;

PGraphics paintArea;
PImage colourWheel;
PImage lineImage;
PImage splatterImage;
PImage spiralImage;
PImage growingRootImage;
PImage saveIconImage;

PFont font;

color clickColour;

color col = color(30, 170, 255);

//===========================================================================================================================================================================================================//
void setup() {
  size(1280, 720);

  paintArea = createGraphics(width, height-UIHeight);
  brush = new Brush();
  font = createFont("arial", fontSize);
  cp5 = new ControlP5(this);

  loadingScreen = new LoadingScreen();

  // Tried using the TextBox.draw() function for each one but it wouldn't work properly. Couldn't get the text boxes to disappear while the loading screen was working
  inputRed = new TextBox("R ", 180, rowHeight1);
  inputGreen = new TextBox("G ", 180, rowHeight2);
  inputBlue = new TextBox("B ", 180, rowHeight3);
  inputRadius = new TextBox("Radius ", 330, rowHeight1);
  inputAngle = new TextBox("Angle ", 330, rowHeight2);
  inputCount = new TextBox("Count ", 330, rowHeight3);
  inputSplatter = new TextBox("Splatter ", 500, rowHeight1);
  inputStroke = new TextBox("Stroke ", 500, rowHeight2);
  inputStep = new TextBox("Step ", 500, rowHeight3);
  inputSin = new TextBox("Sin ", 625, rowHeight1);
  inputCos = new TextBox("Cos ", 625, rowHeight2);

  lineToggle = new ToggleButton(710, height-30, 100, 20, "Line"); 
  splatterToggle = new ToggleButton(825, height-30, 100, 20, "Splatter");
  spiralToggle = new ToggleButton(950, height-30, 100, 20, "Spiral");
  rootsToggle = new ToggleButton(1075, height-30, 100, 20, "Roots");

  clearButton = new Button(590, rowHeight3, 100, 20, "Clear Canvas");
  saveButton = new Button(1200, rowHeight3, 70, 20, "Save");
}


//===========================================================================================================================================================================================================//
void draw() {
  if (loadingScreen.start == false) {
    loadingScreen.draw();
  } 
  if (loadingScreen.loadingDone == true) {

    // Setup of static items
    background(255);
    strokeWeight(2);
    line(0, height-UIHeight, width, height-UIHeight);
    fill(0);
    stroke(0);
    ellipse(15, height-UIHeight + 15, 15, 15);
    fill(255);
    ellipse(135, height-UIHeight + 15, 15, 15);

    // Creating Buttons, Toggle Buttons and labels
    lineToggle.draw();
    splatterToggle.draw();
    spiralToggle.draw();
    rootsToggle.draw();

    clearButton.draw();
    saveButton.draw();

    createLabels();
    
    // Loading all images. Didn't get time to create a class for this
    colourWheel = loadImage("GradientColourWheel.png");
    colourWheel.resize(UIHeight-10, UIHeight-10);
    image(colourWheel, 5, height-UIHeight+5);

    lineImage = loadImage("LineImage.png");
    lineImage.resize(UIHeight-50, UIHeight-50);
    image(lineImage, 710, height-UIHeight+5);

    splatterImage = loadImage("SplatterImage.png");
    splatterImage.resize(UIHeight-50, UIHeight-50);
    image(splatterImage, 825, height-UIHeight+5);

    spiralImage = loadImage("SpiralImage.png");
    spiralImage.resize(UIHeight-50, UIHeight-50);
    image(spiralImage, 950, height-UIHeight+5);

    growingRootImage = loadImage("GrowingRootImage.png");
    growingRootImage.resize(UIHeight-50, UIHeight-50);
    image(growingRootImage, 1075, height-UIHeight+5);

    saveIconImage = loadImage("SaveIcon.png");
    saveIconImage.resize(UIHeight/2, UIHeight/2);
    image(saveIconImage, 1197, height-UIHeight+(UIHeight/5));

    // Limiting the drawing area
    if (mouseY < (height-UIHeight)) {
      paintArea.beginDraw();
      brush.draw();
      paintArea.endDraw();
    }
    image(paintArea, 0, 0);
  }
}




//===========================================================================================================================================================================================================//
void mousePressed() {
  
  // Check colour if over the Colour Wheel
  if (mouseY > height-UIHeight && mouseX < UIHeight) {
    clickColour = get(mouseX, mouseY);
    red = red(clickColour);
    green = green(clickColour);
    blue = blue(clickColour);
  }
  
  // Clear the painting area using the 'Clear Canvas' button
  if (clearButton.checkIfPressed() == true) {
    paintArea.clear();
  }
  
  // Save an image if over the 'Save' button
  if (saveButton.checkIfPressed() == true) {
    saveCount++;
    paintArea.save("MyImages/" + "My_Image_" + saveCount + ".png");
  }
  
  
  // Switch between all of the drawing tools
  if (lineToggle.checkIfPressed() == true) {
    brush.setBrush(1);
    splatterToggle.isActive = false;
    spiralToggle.isActive = false;
    rootsToggle.isActive = false;
  }
  if (splatterToggle.checkIfPressed() == true) {
    brush.setBrush(2);
    lineToggle.isActive = false;
    spiralToggle.isActive = false;
    rootsToggle.isActive = false;
  }
  if (spiralToggle.checkIfPressed() == true) {
    brush.setBrush(3);
    lineToggle.isActive = false;
    splatterToggle.isActive = false;
    rootsToggle.isActive = false;
  }
  if (rootsToggle.checkIfPressed() == true) {
    brush.setBrush(4);
    lineToggle.isActive = false;
    splatterToggle.isActive = false;
    spiralToggle.isActive = false;
  }
}



//===========================================================================================================================================================================================================//
void mouseClicked() {
  // Used for the spiral effect
  if (brush.brushType == 3) {
    brush.spiralReset();
  }
}


//===========================================================================================================================================================================================================//
void mouseDragged() {
  // Used for the spiral effect
  if (brush.brushType == 3) {
    brush.draw();
    brush.spiralReset();
  }
}


void createLabels() {
  
  // Create labels to show the vairables once thy have been entered
  pushStyle();
  textAlign(LEFT);
  textSize(12);
  fill(0);
  text(" = " + (int) red, inputRed.posX + 30, inputRed.posY + 15);
  text(" = " + (int) green, inputGreen.posX + 30, inputGreen.posY + 15);
  text(" = " + (int) blue, inputBlue.posX + 30, inputBlue.posY + 15);
  text(" = " + brush.radius, inputRadius.posX + 30, inputRadius.posY + 15);
  text(" = " + brush.inputAngle, inputAngle.posX + 30, inputAngle.posY + 15);
  text(" = " + brush.count, inputCount.posX + 30, inputCount.posY + 15);
  text(" = " + brush.splatRadius, inputSplatter.posX + 30, inputSplatter.posY + 15);
  text(" = " + brush.strokeWeight, inputStroke.posX + 30, inputStroke.posY + 15);
  text(" = " + brush.step, inputStep.posX + 30, inputStep.posY + 15);
  text(" = " + brush.sin, inputSin.posX + 30, inputSin.posY + 15);
  text(" = " + brush.cos, inputCos.posX + 30, inputCos.posY + 15);
  popStyle();
}


//===========================================================================================================================================================================================================//
void controlEvent(ControlEvent theEvent) {

  // Checking each Controller (TextBox) and assigning the controller entry to the correct variable
  Controller controller = theEvent.getController();
  String control = controller.getLabel();

  if (control == "R ") {
    String redInput = cp5.get(Textfield.class, "R ").getText();
    int redInputNum = int(redInput);
    red = redInputNum;
  }
  if (control == "G ") {
    String greenInput = cp5.get(Textfield.class, "G ").getText();
    int greenInputNum = int(greenInput);
    green = greenInputNum;
  }
  if (control == "B ") {
    String blueInput = cp5.get(Textfield.class, "B ").getText();
    int blueInputNum = int(blueInput);
    blue = blueInputNum;
  }
  if (control == "Radius ") {
    String radiusInput = cp5.get(Textfield.class, "Radius ").getText();
    int radiusInputNum = int(radiusInput);
    brush.radius = radiusInputNum;
  }
  if (control == "Angle ") {
    String angleInput = cp5.get(Textfield.class, "Angle ").getText();
    int angleInputNum = int(angleInput);
    brush.inputAngle = angleInputNum;
  }
  if (control == "Count ") {
    String counterInput = cp5.get(Textfield.class, "Count ").getText();
    int counterInputNum = int(counterInput);
    brush.count = counterInputNum;
  }
  if (control == "Splatter ") {
    String splatterInput = cp5.get(Textfield.class, "Splatter ").getText();
    int splatterInputNum = int(splatterInput);
    brush.splatRadius = splatterInputNum;
  }
  if (control == "Stroke ") {
    String strokeInput = cp5.get(Textfield.class, "Stroke ").getText();
    int strokeInputNum = int(strokeInput);
    brush.strokeWeight = strokeInputNum;
  }
  if (control == "Step ") {
    String stepInput = cp5.get(Textfield.class, "Step ").getText();
    int stepInputNum = int(stepInput);
    brush.step = stepInputNum;
  }
  if (control == "Sin ") {
    String sinInput = cp5.get(Textfield.class, "Sin ").getText();
    int sinInputNum = int(sinInput);
    brush.sin = sinInputNum;
  }
  if (control == "Cos ") {
    String cosInput = cp5.get(Textfield.class, "Cos ").getText();
    int cosInputNum = int(cosInput);
    brush.cos = cosInputNum;
  }
}
