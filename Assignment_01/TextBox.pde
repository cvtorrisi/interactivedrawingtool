class TextBox {

  String text;
  int posX;
  int posY;


  //===========================================================================================================================================================================================================//
  TextBox(String textCaption, int positionX, int positionY ) {
    posX = positionX;
    posY = positionY;
    text = textCaption;
    cp5.addTextfield(textCaption)
      .setPosition(positionX, positionY)
      .setSize(30, fontSize+5)
      .setFont(font)
      .setFocus(true)
      .setAutoClear(true)
      .setColor(color(0))
      .setColorBackground(0xffffffff)
      .setColorCaptionLabel(0xff000000)
      .setMin(0)
      .setMax(255)
      .setColorActive(0xffff0000)
      .align(0,0,10,10); 
  }
  
  
  
  

}
