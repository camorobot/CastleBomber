int aantalBommen = 25;
int aantalSchatten = 7;
int aantalSchattenGevonden = 0;
int aantalSinkHoles = 3;
int aantalMuren = 15;
int aantalKoning = 0;
int aantalSchattenGezet = 0;
int aantalBommendepodGezet = 0;
int aantalSinkholesGezet = 0;
int aantalmurenGezet = 0;
int aantalKoningGezet = 0;
boolean isKoningGevonden = false;


// kijkt hoeveel punten er moet worden gegeven als je een schat klikt
void aantalSchattenOpgegraven(int xPosMouse, int yPosMouse) {
  if (gridSpeelveld[xPosMouse][yPosMouse] == 1) {
    aantalSchattenGevonden++;
  } else if (gridSpeelveld[xPosMouse][yPosMouse] == 6) {
    println("6");
    aantalSchattenGevonden = aantalSchattenGevonden +2;
  } else if (gridSpeelveld[xPosMouse][yPosMouse] == 7) {
    aantalSchattenGevonden = aantalSchattenGevonden +3;
  }
}

// kijkt of het aantal bommen op is
void aantalBommenOp() {
  if (aantalBommen <= 0) {
    isKoningGevonden = false;
    huidigeScherm = 3;
  }
}


// kijkt of je meer bommen moet krijgen als je een bommenpot raakt
void bompottenGevonden() {
  aantalBommen = aantalBommen +5;
}

// kijkt of het spel is afgelopen door een gevonden koning.
void koningGevonden() {
  isKoningGevonden = true;
  huidigeScherm = 3 ;
}
