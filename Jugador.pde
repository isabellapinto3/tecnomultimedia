class Jugador {

  //Propiedades 
  float x, y;
  float tw=width/7;
  float ty=width/5;
  float mx, my;
  float dx, dy;
  PImage imgdorothy;
  PImage mira;
  PImage disparo;

  //CONSTRUCTOR
  //inicializar posición.
  Jugador() {
    imgdorothy=loadImage("dorothy.png");
    imgdorothy.resize(int(tw), int(ty)); 
    mira=loadImage("mira.png");
    mira.resize(50, 50);
    disparo=loadImage("disparo.png");
    disparo.resize(150, 150);
  }

  //METODOS
  void dibujar() {    
    pushStyle();
    tint(100, 150, 100);
    image(imgdorothy, width/2, height-100);
    popStyle();
  }

  void puntero(float mx_, float my_) {
    mx=mx_;
    my=my_;
    pushStyle();
    tint(0, 255, 0);
    image(mira, mx, my);
    popStyle();
  }

  void disparar(float dx_, float dy_, float x2, float y2, float tx2, float ty2) {
    dx=dx_;
    dy=dy_;
    image(disparo, dx, dy);

    //Llamo la función matar de bruja.
    if (dx > x2 - tx2/2 && dx < x2 + tx2/2 && dy > y2- ty2/2 && dy < y2 +  ty2/2) {
      juego.bmatar();
    }
  }
}
