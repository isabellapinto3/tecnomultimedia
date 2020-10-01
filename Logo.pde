class Logo {

  //Propiedades
  //Ubicación del logo
  float x, y;
  //Tamaño del logo
  int tx, ty; 
  //Velocidad del logo
  float velx, vely;
  color relleno;
  int r, g, b;
  //imagen
  PImage foto;

  //Constructor
  Logo(int r_, int g_, int b_) {
    //Posición inicial
    x=width/2;
    y=height/2;
    //Tamaño
    tx=100;
    ty=80;
    //Velocidad
    velx=4;
    vely=4;
    //Color
    r=r_;
    g=g_;
    b=b_;
    relleno=color(r, g, b);
    //Cargo imagen dvd
    foto = loadImage("foto.png");
    foto.resize(tx,ty);
    
  }
  //---------------------------------------------
  //FUNCIONES
  //Dibujar el logo
  void dibujar(){
     tint(relleno);
    image(foto,x,y);
  }      
      
  //Movimiento del logo
  void mover(int r,int g, int b) {
    x= x + velx;
    y= y + vely;
   

    //Si el borde de X choca en width se da vuelta
    if (x+tx == width) {
      velx = -velx;
      relleno=color(r,g,b);
    }
     
     else if (x==0) {
      velx= velx *-1;
      relleno=color(r,g,b);
    }
    //Si el borde de y choca en height se da vuelta
    if (y+ty == height) {
      vely = -vely;
      relleno=color(r,g,b);
       
      
    } else if (y==0) {
      vely= vely *-1;
      relleno=color(r,g,b);
       
    }
  }

}
