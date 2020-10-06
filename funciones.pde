//Crea instrucciónes para el usuario
void instruccion1() {
  textSize(16);
  fill(255);
  rect(width/2, height-30, 400, 30);
  fill(0);
  text("Haz click al personaje con el que quieras interactuar", width/2, height-30);
} 
void instruccion2() {
  fill(255);
  rectMode(CENTER);
  rect(width/2, height-30, 400, 30);
  fill(0);
  text("Haz click en la pantalla para avanzar la conversación", width/2, height-30);
}

//Crea botones recurrentes de volver a jugar, etc.
void botones() {
  rectMode(CENTER);
  noStroke();
  fill(255);
  rect(width/2, height/2+200, 150, 50);
  fill(0);
  textAlign(CENTER, CENTER);

  if (mouseX<width/2+75 && mouseX>width/2-75 && mouseY>height/2+200-25 && mouseY<height/2+200+25) {
    fill(230);
    rect(width/2, height/2+200, 150, 50);
  }
}

//Crea los globos de dialogo.
void globos(String t, int x, int y, int sx, int sy) {
  fill(255);
  rectMode(CENTER);
  textMode(CENTER);
  textSize(16);
  rect(x, y, sx, sy);
  fill(0);
  text(t, x, y);
}

//Crea flechas para moverse entre estados.
void flecha(int d, float x, float y) {
  if (d==0) {
    image(flechab, x, y);
  }
  if (d==1) {
    image(flechai, x, y);
  }
}

//Para volver a jugar.
void restart() {
  estado="inicio";

  for (int i = 0; i<9; i++) {
    c[i]=false;
  }
  for (int i = 0; i<9; i++) {
    p[i]=false;
  }
  for (int i=0; i<6; i++) {
    k[i]=false;
  }
  for (int i = 0; i<6; i++) {
    r[i]=false;
  }
  for (int i = 0; i<5; i++) {
    cl[i] = false;
  }
  for (int i = 0; i<6; i++) {
    rl[i] = false;
  }
  for (int i = 0; i<8; i++) {
    ca[i]=false;
  }
  for (int i = 0; i<8; i++) {
    ra[i]=false;
  }
  for (int i = 0; i <8; i++) {
    cb[i]=false;
  }
  for (int i = 0; i <8; i++) {
    rb[i]=false;
  }
  burbuja=false;
  fleman=false;
  flechaleon=false;
  flechacastillo=false;
  seguir=false;
  flechalata=false;
  izq=false;
  der=false;
  agarrar=false;
  desoxidado=false;
  opcion=false;
  cr[0]=width;
  cr[1]=width+100;
  cr[2]=width+150;
  cr[3]=width+200;
  cr[4]=width+250;
  tornx=-200;
  burby=300;
  for (int i=0; i<5; i++) {
    contador[i] = 0;
  }
  vj=false;
  vj2=false;
}
