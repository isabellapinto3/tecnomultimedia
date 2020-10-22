class Contador {
  //Contador = Muestra detalles de vida y tiempo en la pantalla.

  //Propiedades
  int tiemporegr;
  PFont fuente;
  int vida;
  int r, g, b;

  //Constructor
  Contador() {
    fuente = loadFont("Rubik-Regular-48.vlw");
    textFont(fuente, 32);   
    rectMode(CORNER);
    vida=400;
  }

  //Metodos
  void dibujar() {
    pushStyle();
    fill(255);
    noStroke();
    rect(width/2-150, 30, 400, 10, 50);
    fill(r, g, b);
    rect(width/2-150, 30, vida, 10, 50);
    tiemporegr=30-millis()/1000;
    text(tiemporegr, width/5, 50);
    popStyle();


    if (vida<130) {
      r=255;
      g=0;
      b=0;
    }
    if (vida<260 && vida>130) {
      r=255;
      g=100;
      b=0;
    }
    if (vida>260) {
      r=0;
      g=255;
      b=0;
    }
  }


}
