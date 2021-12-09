int[] beginOpnieuwKnop = new int[4];

void setupEndScherm() {
}

// Teken het scherm dat getoond moet worden
void drawScherm3() {
  background(COLOR_PURPLE);
  viewStats();
  beginOpnieuwKnop();
}

// Teken de aantal punten etc.
void viewStats() {
  int xPosScore = width/2-55;
  int yPosScore = height / 100*20;
  
  if(isKoningGevonden){
    text("Spel is afgelopen omdat koning is gevonden", xPosScore+50, yPosScore-55);
  } else {
    text("Spel is afgelopen omdat de bommen op waren", xPosScore+50, yPosScore-55);
  }
  textAlign(LEFT);
  println("Je score was: "+ aantalSchattenGevonden);
  text("Je score was: "+ aantalSchattenGevonden, xPosScore-10, yPosScore);
}

// teken het nog een keer spelen knop
void beginOpnieuwKnop() {
  int sizeKnopHeight = 60;
  int sizeKnopWidth = 150;
  int yPos = height /2 + sizeKnopHeight*3;
  int xPos = width /2 - sizeKnopWidth /2;

  beginOpnieuwKnop = initialiseerKnop(xPos, yPos, sizeKnopWidth, sizeKnopHeight);
  tekenKnop(beginOpnieuwKnop, "Begin Opnieuw");
}

// reset alle vars terug naar de begin waarden.
void eindSchermMousePressed() {
  if (gekliktOpKnop(beginOpnieuwKnop)) {
    // reset vars en begin opnieuw
    alreadyRunSetup2 = false;
    aantalBommen = 25;
    aantalSchattenGezet = 0;
    aantalBommendepodGezet = 0;
    aantalSinkholesGezet = 0;
    aantalmurenGezet = 0;
    aantalKoningGezet = 0;
    aantalSchattenGevonden = 0;
    huidigeScherm = 1;
  }
}
