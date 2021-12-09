// zet cheats op true als je wilt dat het programma alles zelf doet.
final boolean cheats = false;
final int gameSize = 588;
final int infoRuitme = 100;
final int infoMargin = 10;

int huidigeScherm = 1;
int aantalGrid;
boolean alreadyRunSetup2 = false;

void setup() {
  //OVERIGE RUIME IS speelveld ruimte is 588,
  //informatie ruimte is 100
  size(588, 688);
}

void draw() {
  switch(huidigeScherm) {
  case 1:
    drawScherm1();
    break;
  case 2:
    tekenInformatie();
    drawScherm2();
    aantalBommenOp();
    VulElementen();
    if (cheats){
      showAll();
    } else {}
    break;
  case 3:
    drawScherm3();
    break;
  default:
    println(huidigeScherm);
    break;
  }
}

void mousePressed() {
  switch(huidigeScherm) {
  case 1:
    startSchermMousePressed();
    break;
  case 2:
    playMousePressed();
    break;
  case 3:
    eindSchermMousePressed();
    break;
  default:
    break;
  }
}
