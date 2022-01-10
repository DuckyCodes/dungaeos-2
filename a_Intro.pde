void intro() {

  //Looks in intro
  textFont(font);
  background(black);
  introGIF.show();
  introButton.show();


  if (introButton.clicked) {
    mode = gmode;
  }
}
