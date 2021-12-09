int[][] gridSpeelveld = new int[aantalGrid][aantalGrid];

int breedteHokje;
int hoogteHokje;

// Voer setupuit van scherm2
void setupScherm2(){
  initSpeelveld();
}

//Voer de draw uit van scherm2
void drawScherm2(){
  runSetup2();
}

// Zorg dat de setup maar 1 keer word gedaan
void runSetup2(){
  if(alreadyRunSetup2 == false){
    setupScherm2();
    alreadyRunSetup2 = true;
  } 
}

// INITALISEER HET SPEELVELD
void initSpeelveld() {
  gridSpeelveld = new int[aantalGrid][aantalGrid];
  background(COLOR_GREEN);
  println("Aantalgrid", aantalGrid);
  //VUL HET SPEELVELD MET ALLEMAAL 0
  for (int i = 0; i < gridSpeelveld.length; i++) {
    for (int j = 0; j < gridSpeelveld.length; j++) {
      gridSpeelveld[i][j] = 0;
      println("aantalgrid: ", aantalGrid);
      println("array length: ", gridSpeelveld.length);
    }
  }
  println("berekenspeelveld");

  // Bereken het speelveld grid.
  for (int rij = 0; rij < aantalGrid; rij++) {
    for (int kolom = 0; kolom <aantalGrid; kolom++) {
      tekenSpeelveld(breedteHokje, hoogteHokje, rij, kolom);
    }
  }
  println("Hoogte/Breedte Hokje: ", breedteHokje);
  println("Hoogte/Breedte Hokje: ", hoogteHokje);
  
}


// code voor het vullen van de grid met schatten.
void VulElementen(){
  int row = int(random(0,gridSpeelveld.length));
  int column = int(random(0,gridSpeelveld.length));
  
  if(aantalSchattenGezet != aantalSchatten){
    if(gridSpeelveld[row][column] == 0){
      gridSpeelveld[row][column] = 1;
      aantalSchattenGezet++;
    } else {
      VulElementen();
    }
  }
  else if(aantalBommendepodGezet != 5){
    if(gridSpeelveld[row][column] == 0){
      gridSpeelveld[row][column] = 2;
      aantalBommendepodGezet++;
    } else {
      VulElementen();
    }
  }
  else if(aantalSinkholesGezet != aantalSinkHoles){
    if(gridSpeelveld[row][column] == 0){
      gridSpeelveld[row][column] = 3;
      aantalSinkholesGezet++;
    } else {
      VulElementen();
    }
  } 
  else if(aantalmurenGezet != aantalMuren){
    if(gridSpeelveld[row][column] == 0){
      gridSpeelveld[row][column] = 4;
      aantalmurenGezet++;
    } else {
      VulElementen();
    }
  }
  else if(aantalKoningGezet != aantalKoning){
    if(gridSpeelveld[row][column] == 0){
      gridSpeelveld[row][column] = 5;
      aantalKoningGezet++;
    } else {
      VulElementen();
    }
  }
}

void tekenSpeelveld(int breedteHokje, int hoogteHokje, int rij, int kolom) {
  fill(COLOR_GREEN);
  stroke(0);
  rect(breedteHokje*rij, hoogteHokje*kolom, breedteHokje, hoogteHokje);
}

void brekenMouseClicked(int xPosMouse, int yPosMouse) {
  int krijgKleurVakje = get(mouseX, mouseY);

  println("Hokje rij: ", yPosMouse);
  println("Hokje kolom: ", xPosMouse);

  //kijk of er al op het hokje is geklikt
  if (krijgKleurVakje == COLOR_WHITE || krijgKleurVakje == COLOR_GOLD || krijgKleurVakje == COLOR_GRAY || krijgKleurVakje == COLOR_BLACK || krijgKleurVakje == COLOR_GOLD_PALE || krijgKleurVakje == COLOR_GOLD_METALLIC) {
    println("Is al op geklikt");
  } else {
    // verander hokje naar 99 zodat het niet nog een keer kan worden gebruikt.
    //Check of het geklikte hokje een schat is.
    if (gridSpeelveld[xPosMouse][yPosMouse] == 1) {
      println("Grid onderdeel = 1 (Schatten)");
      aantalSchattenOpgegraven(xPosMouse, yPosMouse);
      tekenGelikteHokje(xPosMouse, yPosMouse, breedteHokje, hoogteHokje, COLOR_GOLD);
      gridSpeelveld[xPosMouse][yPosMouse] = 99;

      //check of het geklikte hokje een Bompot is.
    } else if (gridSpeelveld[xPosMouse][yPosMouse] == 2) {
      println("Grid onderdeel = 2 (Bommen Pot)");
      tekenGelikteHokje(xPosMouse, yPosMouse, breedteHokje, hoogteHokje, COLOR_GRAY);
      bompottenGevonden();
      gridSpeelveld[xPosMouse][yPosMouse] = 99;

      //check of het een sinkhole is.
    } else if (gridSpeelveld[xPosMouse][yPosMouse] == 3) {
      println("Grid onderdeel = 3 (Sinkhole)");

      // Als het een muur is teken een Zwarte Vierkant
    } else if (gridSpeelveld[xPosMouse][yPosMouse] == 4) {
      println("Grid onderdeel = 4 (muur)");
      tekenGelikteHokje(xPosMouse, yPosMouse, breedteHokje, hoogteHokje, COLOR_BLACK);
      gridSpeelveld[xPosMouse][yPosMouse] = 99;

      //Als het de koning is teken een Rode Vierkant
    } else if (gridSpeelveld[xPosMouse][yPosMouse] == 5) {
      println("Grid onderdeel = 5 (Koning)");
      tekenGelikteHokje(xPosMouse, yPosMouse, breedteHokje, hoogteHokje, COLOR_RED);
      gridSpeelveld[xPosMouse][yPosMouse] = 99;
      koningGevonden();

      //Als het een Schat2 is teken een Gouden2 Vierkant
    } else if (gridSpeelveld[xPosMouse][yPosMouse] == 6) {
      println("Grid onderdeel = 6 (Schatten +2)");
      tekenGelikteHokje(xPosMouse, yPosMouse, breedteHokje, hoogteHokje, COLOR_GOLD_PALE);
      aantalSchattenOpgegraven(xPosMouse, yPosMouse);
      gridSpeelveld[xPosMouse][yPosMouse] = 99;

      //Als het een Schat3 is teken een Gouden3 Vierkant
    } else if (gridSpeelveld[xPosMouse][yPosMouse] == 7) {
      println("Grid onderdeel = 4 (Schatten +3)");
      tekenGelikteHokje(xPosMouse, yPosMouse, breedteHokje, hoogteHokje, COLOR_GOLD_METALLIC);
      aantalSchattenOpgegraven(xPosMouse, yPosMouse);
      gridSpeelveld[xPosMouse][yPosMouse] = 99;

      // Als het geen van alle is dan kleur het hokje wit in met betegenis van niks.
    } else if (gridSpeelveld[xPosMouse][yPosMouse] == 99){
      println("");
    } else if (gridSpeelveld[xPosMouse][yPosMouse] == 0) {
      tekenGelikteHokje(xPosMouse, yPosMouse, breedteHokje, hoogteHokje, COLOR_WHITE);
      aantalSchattenOpgegraven(xPosMouse, yPosMouse);
      gridSpeelveld[xPosMouse][yPosMouse] = 99;
    }
    aantalBommenOp();
  }
}

//Teken het hokje dat je hebt aangeklikt
void tekenGelikteHokje(int xPosMouse, int yPosMouse, int breedteHokje, int hoogteHokje, int kleur) {
  xPosMouse = breedteHokje * xPosMouse;
  yPosMouse = hoogteHokje * yPosMouse;
  fill(kleur);
  rect(xPosMouse, yPosMouse, breedteHokje, hoogteHokje);
}

// Teken het gedeelte onderaan het scherm met alle informatie
void tekenInformatie() {
  fill(COLOR_WHITE);
  rect(0, gameSize, width, infoRuitme);
  fill(COLOR_BLACK);
  textAlign(LEFT);
  text("AANTAL BOMMEN IS: "+ aantalBommen, infoMargin, gameSize + infoMargin*3);
  text("AANTAL GEVONDEN SCHATTEN IS: "+ aantalSchattenGevonden, infoMargin, gameSize + infoMargin*6);
}

// Voer dit uit als er op de muis word geklikt
void playMousePressed() {
  int xPosMouse = mouseX / hoogteHokje;
  int yPosMouse = mouseY / hoogteHokje;
  int posMouseUp = yPosMouse-1;
  int posMouseDown = yPosMouse +1;
  int posMouseLeft = xPosMouse -1;
  int posMouseRight = xPosMouse +1;
  berekenBommen(xPosMouse, yPosMouse);
  println("MouseX ", mouseX, "MouseY ", mouseY);
  // Kijk of er wel binnen het grid word geklikt. Anders geef een error.
  if (yPosMouse >= gridSpeelveld.length || xPosMouse >= gridSpeelveld.length) {
    println("ERROR: OUT OF RANGE");
  } else{
    //pak het hokje erboven, eronder, link, en rechts. reken dan uit of die buiten het spel vallen, zoja, teken ze niet, zo nee teken ze wel.
    println("MouseUp",posMouseUp," MouseDown",posMouseDown, " MouseLeft", posMouseLeft," MouseRight",posMouseRight);
    if(posMouseUp <0 && posMouseRight >=gridSpeelveld.length){ // teken het hokje boven rechts in de hoek
      println("HOEKJE BOVEN RECHTS");
      if (gridSpeelveld[xPosMouse][yPosMouse] == 3){
        println("");
      } else {
        brekenMouseClicked(xPosMouse-1, yPosMouse);
        brekenMouseClicked(xPosMouse, yPosMouse+1);
        brekenMouseClicked(xPosMouse, yPosMouse);
        berekenBommen(xPosMouse, yPosMouse);
      }
    } else if (posMouseUp <0 && posMouseLeft < 0){  // teken het hokje boven links in de hoek
      if (gridSpeelveld[xPosMouse][yPosMouse] == 3){
        println("");
      } else {
        brekenMouseClicked(xPosMouse+1, yPosMouse);
        brekenMouseClicked(xPosMouse, yPosMouse+1);
        brekenMouseClicked(xPosMouse, yPosMouse);
        berekenBommen(xPosMouse, yPosMouse);
      }
      println("HOEKJE BOVEN LINKS");
    } else if(posMouseDown >=gridSpeelveld.length && posMouseRight >=gridSpeelveld.length){ // teken het hokje onder rechts in de hoek
        if (gridSpeelveld[xPosMouse][yPosMouse] == 3){
        println("");
      } else {
        brekenMouseClicked(xPosMouse-1, yPosMouse);
        brekenMouseClicked(xPosMouse, yPosMouse-1);
        brekenMouseClicked(xPosMouse, yPosMouse);
        berekenBommen(xPosMouse, yPosMouse);
      }
        println("HOEKJE ONDER RECHTS");
    } else if (posMouseDown >=gridSpeelveld.length && posMouseLeft < 0){  // teken het hokje onder links in de hoej
      if (gridSpeelveld[xPosMouse][yPosMouse] == 3){
        println("");
      } else {
        brekenMouseClicked(xPosMouse+1, yPosMouse);
        brekenMouseClicked(xPosMouse, yPosMouse-1);
        brekenMouseClicked(xPosMouse, yPosMouse);
        berekenBommen(xPosMouse, yPosMouse);
      }
      println("HOEKJE ONDER LINKS");
    } else if(posMouseUp <0){                          // teken het hokje boven het veld
        if (gridSpeelveld[xPosMouse][yPosMouse] == 3){
        println("");
      } else {
        brekenMouseClicked(xPosMouse+1, yPosMouse);
        brekenMouseClicked(xPosMouse-1, yPosMouse);
        brekenMouseClicked(xPosMouse, yPosMouse+1);
        brekenMouseClicked(xPosMouse, yPosMouse);
        berekenBommen(xPosMouse, yPosMouse);
      }
      println("UP BUITEN HET VELD");                  
    } else if (posMouseDown >=gridSpeelveld.length){ // teken het hoekje onder het veld
      if (gridSpeelveld[xPosMouse][yPosMouse] == 3){
        println("");
      } else {
        brekenMouseClicked(xPosMouse+1, yPosMouse);
        brekenMouseClicked(xPosMouse-1, yPosMouse);
        brekenMouseClicked(xPosMouse, yPosMouse-1);
        brekenMouseClicked(xPosMouse, yPosMouse);
        berekenBommen(xPosMouse, yPosMouse);
      }
      println("DOWN BUITEN HET VELD");
    } else if(posMouseRight >=gridSpeelveld.length){// teken het hokje rechts van het veld
        if (gridSpeelveld[xPosMouse][yPosMouse] == 3){
        println("");
      } else {
        brekenMouseClicked(xPosMouse-1, yPosMouse);
        brekenMouseClicked(xPosMouse, yPosMouse+1);
        brekenMouseClicked(xPosMouse, yPosMouse-1);
        brekenMouseClicked(xPosMouse, yPosMouse);
        berekenBommen(xPosMouse, yPosMouse);
      }
      println("RIGHT BUITEN HET VELD");
    } else if(posMouseLeft <0){                    // teken het hokje links buiten het veld.
      if (gridSpeelveld[xPosMouse][yPosMouse] == 3){
        println("");
      } else {
        brekenMouseClicked(xPosMouse+1, yPosMouse);
        brekenMouseClicked(xPosMouse, yPosMouse+1);
        brekenMouseClicked(xPosMouse, yPosMouse-1);
        brekenMouseClicked(xPosMouse, yPosMouse);
        berekenBommen(xPosMouse, yPosMouse);
      }
      println("LEFT BUITEN HET VELD");
    }
    else{                                        // teken het hokje in het midden van het veld.
        if (gridSpeelveld[xPosMouse][yPosMouse] == 3){
        println("");
      } else {
        brekenMouseClicked(xPosMouse+1, yPosMouse);
        brekenMouseClicked(xPosMouse-1, yPosMouse);
        brekenMouseClicked(xPosMouse, yPosMouse+1);
        brekenMouseClicked(xPosMouse, yPosMouse-1);
        brekenMouseClicked(xPosMouse, yPosMouse);
        berekenBommen(xPosMouse, yPosMouse);
      }
      println("alles is goed.");
    }
  }
}

void berekenBommen(int xPosMouse, int yPosMouse){
  if (yPosMouse >= gridSpeelveld.length || xPosMouse >= gridSpeelveld.length){
    println("");
  } else{
    if(gridSpeelveld[xPosMouse][yPosMouse] != 99){
      aantalBommen = aantalBommen -1;
    }
  }
}





// Dit word alleen gebruikt als cheats == true, (Zit bijna dezelfde code in als in berekenMouseClicked.)
void showAll() {
  int xPosMouse = int(random(width)) / breedteHokje;
  int yPosMouse = int(random(height)) / hoogteHokje;
  int krijgKleurVakje = get(mouseX, mouseY);
  aantalBommen = 999999999;
  println("Hokje rij: ", yPosMouse);
  println("Hokje kolom: ", xPosMouse);

  if (yPosMouse >= gridSpeelveld.length || xPosMouse >= gridSpeelveld.length) {
    println("ERROR: OUT OF RANGE");
  } else {
    for (int i = 0; i <= gridSpeelveld.length; i++) {
      if (krijgKleurVakje == COLOR_WHITE || krijgKleurVakje == COLOR_GOLD || krijgKleurVakje == COLOR_GRAY || krijgKleurVakje == COLOR_BLACK || krijgKleurVakje == COLOR_GOLD_PALE || krijgKleurVakje == COLOR_GOLD_METALLIC) {
        println("Is al op geklikt");
      } else {

        //Check of het geklikte hokje een schat is.
        if (gridSpeelveld[xPosMouse][yPosMouse] == 1) {
          println("Grid onderdeel = 1 (Schatten)");
          aantalSchattenOpgegraven(xPosMouse, yPosMouse);
          tekenGelikteHokje(xPosMouse, yPosMouse, breedteHokje, hoogteHokje, COLOR_GOLD);

          //check of het geklikte hokje een Bompot is.
        } else if (gridSpeelveld[xPosMouse][yPosMouse] == 2) {
          println("Grid onderdeel = 2 (Bommen Pot)");
          tekenGelikteHokje(xPosMouse, yPosMouse, breedteHokje, hoogteHokje, COLOR_GRAY);
          bompottenGevonden();

          // Als het geen van alle is dan kleur het hokje wit in met betegenis van niks.
        } else if (gridSpeelveld[xPosMouse][yPosMouse] == 3) {
          println("Grid onderdeel = 3 (Sinkhole)");

          // Als het een muur is teken een Zwarte Vierkant
        } else if (gridSpeelveld[xPosMouse][yPosMouse] == 4) {
          println("Grid onderdeel = 4 (muur)");
          tekenGelikteHokje(xPosMouse, yPosMouse, breedteHokje, hoogteHokje, COLOR_BLACK);

          //Als het de koning is teken een Rode Vierkant
        } else if (gridSpeelveld[xPosMouse][yPosMouse] == 5) {
          println("Grid onderdeel = 5 (Koning)");
          tekenGelikteHokje(xPosMouse, yPosMouse, breedteHokje, hoogteHokje, COLOR_RED);
          koningGevonden();

          //Als het een Schat2 is teken een Gouden2 Vierkant
        } else if (gridSpeelveld[xPosMouse][yPosMouse] == 6) {
          println("Grid onderdeel = 6 (Schatten +2)");
          tekenGelikteHokje(xPosMouse, yPosMouse, breedteHokje, hoogteHokje, COLOR_GOLD_PALE);

          //Als het een Schat3 is teken een Gouden3 Vierkant
        } else if (gridSpeelveld[xPosMouse][yPosMouse] == 7) {
          println("Grid onderdeel = 4 (Schatten +3)");
          tekenGelikteHokje(xPosMouse, yPosMouse, breedteHokje, hoogteHokje, COLOR_GOLD_METALLIC);
          aantalSchattenOpgegraven(xPosMouse, yPosMouse);

          // Als het geen van alle is dan kleur het hokje wit in met betegenis van niks.
        } else {
          tekenGelikteHokje(xPosMouse, yPosMouse, breedteHokje, hoogteHokje, COLOR_WHITE);
          aantalSchattenOpgegraven(xPosMouse, yPosMouse);
        }
        aantalBommen = aantalBommen -1;
      }
    }
  }
  fill(COLOR_BLUE);
  rect(0, 0, 10, 10);
}
