int[] startKnop = new int[4];
int[] meerGrid = new int[4];
int[] minderGrid = new int[4];
int[] meerBommen = new int[4];
int[] minderBommen = new int[4];
int[] meerSchatten = new int[4];
int[] minderSchatten = new int[4];

// maakt 1 keer de knop aan start.
void setupStartScherm(){
  startStartKnop();
}

// de draw functie van scherm 1
void drawScherm1(){
  background(COLOR_RED);
  startStartKnop();
  startGrooteGridSettings();
  startBommenSettings();
  startSchattenSettings();
  checkConstrained();
  tekenText();
}

// tekent de start knop
void startStartKnop(){
  int sizeKnopHeight = 60;
  int sizeKnopWidth = 120;
  int yPos = height /2 + sizeKnopHeight*3;
  int xPos = width /2 - sizeKnopWidth /2;
  
  startKnop = initialiseerKnop(xPos,yPos,sizeKnopWidth,sizeKnopHeight);
  tekenKnop(startKnop,"START");
}

// tekent de knop voor de grid instellingen.
void startGrooteGridSettings(){
  int sizeKnopHeight = 60;
  int sizeKnopWidth = 120;
  int yPosMeer = sizeKnopHeight + 30;
  int xPosMeer = width /100*75 + sizeKnopWidth /2;
  int yPosMinder = sizeKnopHeight+ 30;
  int xPosMinder = width /100*20 - sizeKnopWidth /2;
  
  meerGrid = initialiseerKnop(xPosMeer,yPosMeer,sizeKnopWidth,sizeKnopHeight);
  minderGrid = initialiseerKnop(xPosMinder,yPosMinder,sizeKnopWidth,sizeKnopHeight);
  tekenKnop(meerGrid,"Meer Tegels");
  tekenKnop(minderGrid,"Minder Tegels");
}

// tekent de bommen settings.
void startBommenSettings(){
  int sizeKnopHeight = 60;
  int sizeKnopWidth = 140;
  int yPosMeer = sizeKnopHeight + 140;
  int xPosMeer = width /100*71 + sizeKnopWidth /2;
  int yPosMinder = sizeKnopHeight+ 140;
  int xPosMinder = width /100*20 - sizeKnopWidth /2;
  
  meerBommen = initialiseerKnop(xPosMeer,yPosMeer,sizeKnopWidth,sizeKnopHeight);
  minderBommen = initialiseerKnop(xPosMinder,yPosMinder,sizeKnopWidth,sizeKnopHeight);
  tekenKnop(meerBommen,"Meer Bommen");
  tekenKnop(minderBommen,"Minder Bommen");
}

// tekent de schatten settings.
void startSchattenSettings(){
  int sizeKnopHeight = 60;
  int sizeKnopWidth = 150;
  int yPosMeer = sizeKnopHeight + 250;
  int xPosMeer = width /100*70 + sizeKnopWidth /2;
  int yPosMinder = sizeKnopHeight+ 250;
  int xPosMinder = width /100*20 - sizeKnopWidth /2;
  
  meerSchatten = initialiseerKnop(xPosMeer,yPosMeer,sizeKnopWidth,sizeKnopHeight);
  minderSchatten = initialiseerKnop(xPosMinder,yPosMinder,sizeKnopWidth,sizeKnopHeight);
  tekenKnop(meerSchatten,"Meer Schatten");
  tekenKnop(minderSchatten,"Minder Schatten");
}

// tekent de text op het scherm.
void tekenText(){
  int yPosGrid = height /100*20;
  int xPosGrid = width /2;
  int yPosBommen = height /100*40;
  int xPosBommen = width /2;
  int yPosSchatten = height /100*57;
  int xPosSchatten = width /2;
  text(aantalGrid,xPosGrid,yPosGrid);
  text(aantalBommen,xPosBommen,yPosBommen);
  text(aantalSchatten,xPosSchatten,yPosSchatten);
}

// Zorgt ervoor dat je niet buiten de waardes komt
void checkConstrained(){
  // als je een te groot grid gebruikt krijg je de max bommen.
  if(aantalGrid >= 23){
    aantalGrid = 23;
    aantalBommen = 40;
    println(aantalGrid);
  }
  // als je een te klein grid gebruikt krijg je het minimale aantal bommen
  else if(aantalGrid <= 13){
    aantalGrid = 13;
    aantalBommen = 20;
    println(aantalGrid);
  }
  
  if(aantalBommen >= 40){
    aantalBommen = 40;
    println(aantalBommen);
  }
  if(aantalBommen < 20){
    aantalBommen = 20;
    println(aantalBommen);
  }
  if(aantalSchatten <= 5){
    aantalSchatten = 5;
    println(aantalSchatten);
  }
  if(aantalSchatten >= 10){
    aantalSchatten = 10;
    println(aantalSchatten);
  }
}

// Word gebruikt voor als je op een knop klikt in het startscherm
void startSchermMousePressed(){
  if(gekliktOpKnop(startKnop)){
    println("PLAY");
    println(aantalGrid);
    breedteHokje = width/aantalGrid;
    hoogteHokje = gameSize/aantalGrid;
    
    huidigeScherm++;
  } 
  if(gekliktOpKnop(meerGrid)){
    aantalGrid = aantalGrid +2;
    println(aantalGrid);
  } 
  if(gekliktOpKnop(minderGrid)){
    aantalGrid = aantalGrid -2;
    println(aantalGrid);
  } 
  if(gekliktOpKnop(meerBommen)){
    aantalBommen = aantalBommen +5;
    println(aantalBommen);
  } 
  if(gekliktOpKnop(minderBommen)){
    aantalBommen = aantalBommen -5;
    println(aantalBommen);
  }
  if(gekliktOpKnop(meerSchatten)){
    aantalSchatten = aantalSchatten +1;
    println(aantalSchatten);
  }
  if(gekliktOpKnop(minderSchatten)){
    aantalSchatten = aantalSchatten -1;
    println(aantalSchatten);
  }
}
