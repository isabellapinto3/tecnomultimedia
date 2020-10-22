class Bruja {
  //Propiedades
  float x, y;
  float tx, ty;
  float vida;
  PImage[] bruja = new PImage[20];
  //i es para pasar las posiciones de el arreglo bruja.
  int i= 0;

  //CONSTRUCTOR
  Bruja() {   
    x=random(tx, width-tx/2);
    y=random(ty, height/2+height/4-ty/2);
    vida = 200;
    tx=width/7-25;
    ty=height/5;

    //Cargar imagenes al arreglo bruja
    for (int i=0; i<19; i++) {
      bruja[i]=loadImage("Bruja"+i+".png");
      bruja[i].resize(int(tx), int(ty));
    }
  }

  //METODOS
  void dibujar() {
    if (i<=18) {
      pushStyle();
      tint(100, 150, 100);
      image(bruja[i], x, y);
      popStyle();
    }
    if (i>18) {
      pushStyle();
      tint(100, 150, 100);
      image(bruja[18], x, y);
      popStyle();
    }
  } 

  void matar() {
    vida-=5;
    if (i<=18  ) {
      i+=1;
    }
  }

  void reciclar() {
    x=random(tx, width-tx/2);
    y=random(ty, height/2+height/4-ty/2);
  }
  
  //Cada vez que el tiempo es divisible por 10, la posición de la bruja se actualiza.
  void actualizar(){
  if (millis()/100 %10==0) {
        reciclar();
      }
  }
  

}
