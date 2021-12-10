// state ================================

int[] initialiseerKnop(int x, int y, int b, int h) {
  int[] knop = {x, y, b, h};
  return knop;
}


// logic ================================

boolean gekliktOpKnop(int[] knop) {
  return mouseX > knop[0] && mouseX < knop[0] + knop[2] && mouseY > knop[1] && mouseY < knop[1] + knop[3];
}


// view ===================================

void tekenKnop(int[] knop, String tekst) {  
  noStroke();
  fill(0);
  rect(knop[0]+1, knop[1]+1, knop[2], knop[3]); 
  fill(200);
  rect(knop[0], knop[1], knop[2], knop[3]);  
  fill(0);
  textAlign(CENTER, CENTER);
  textSize(knop[3]/3);
  text(tekst, knop[0] + knop[2]/2, knop[1]+knop[3]/2);
}
