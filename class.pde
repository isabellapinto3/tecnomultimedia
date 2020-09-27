class Objeto {
  //Campos
  float x, y, s;
  
  //Inicializar propiedades
  Objeto(float x_, float y_){
    x = x_;
    y = y_;
    s = width/6;
  }
  
  

  //Metodos
  void moverConMouse() {
    x=mouseX;
    y=mouseY;
  }
  
  //Estilo del circulo
  void dibujo() {
    pushStyle();
    noStroke();
    fill(98,64,240);
    ellipse(x, y, s, s);
    popStyle();
  }
}
