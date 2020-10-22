class Juego {
  //-----------------------------------------------------
  ////PROPIEDADES

  String estado;
  Jugador dorothy;
  Bruja bruja;
  Contador contador;
  float tiempo;  
  PImage fondo;
  PFont woz;
  PFont arial;
  int r, g, b;




  // -----------------------------------------------------
  //CONSTRUCTOR
  Juego() {
   
    
    tiempo=0;
    woz = loadFont("OzsWizard-Scarecrow-60.vlw");
    arial = loadFont("ArialRoundedMTBold-42.vlw");
    estado = "menu";
    dorothy = new Jugador();
    bruja = new Bruja();
    contador = new Contador();
    fondo = loadImage("fondo.png");
    r=255;
    g=255;
    b=255;
  }


  // -----------------------------------------------------
  //METODOS
  void actualizar() {
    bruja.actualizar();
    //-----ESTADO DE JUEGO---------
    //Menu
    println("tiempo:" + tiempo);
    if (estado.equals("menu")) {
      tiempo=0;
      if (mouseX>width/7-50 && mouseX<width/7+50 && mouseY >height/2-5-20 && mouseY<height/2-5+20) {
        r=0;
        b=0;
      } else {
        r=255;
        b=255;
      }
    }

    //Juego
    if (estado.equals("jugar")) {   
      tiempo +=0.10;          

      //Cuando el tiempo supera los 300(30 secs) se pierde el juego.
      if (tiempo>=154) {
        estado="lost";
      }      

      //Cuando la bruja de la vida llega a cero se gana
      if (bruja.vida<=0) {
        estado="win";
      }
    }
  }


  void dibujar() {
    if (estado.equals("menu")) {
      pushStyle();
      tint(100, 150, 100);
      image(fondo, width/2, height/2);
      popStyle();

      pushStyle();
      textAlign(CENTER);      
      textFont(arial, 20);  
      fill(255, 150);
      text("Minijuego", width/7, height/10-5);
      popStyle();

      pushStyle();
      textAlign(CENTER);   
      textFont(woz, 60);           
      text("Ding Dong,", width/3, height/5);

      textFont(arial, 20);   
      text("the witch is dead.", width/3-90, height/5+50);
      popStyle();

      pushStyle();
      textAlign(CENTER);
      fill(255, 150);
      textFont(arial, 18); 
      text("Dispara a la bruja con tu pistola de agua. \n Pero cuidado: si no lo logras en 30 segundos, moriras.", width/2, height-50);   
      popStyle();

      pushStyle();
      fill(r, g, b);
      textFont(arial, 20);
      textAlign(CENTER);
      text("Jugar", width/7, height/2);     
      popStyle();
    }

    if (estado.equals("jugar")) {
      pushStyle();
      tint(100, 150, 100);
      image(fondo, width/2, height/2);
      popStyle();
      dorothy.dibujar();
      bruja.dibujar();
      //Dibujar el contador y vida de la bruja
      contador.dibujar();
      //Dibuja la mira del jugador en mouseX y mouseY
      dorothy.puntero(mouseX, mouseY);
    }
    if (estado.equals("win")) {
    
      pushStyle();
      tint(100, 150, 100);
      image(fondo, width/2, height/2);  
      rectMode(CENTER);
      fill(0, 255, 0, 50);
      rect(width/2, height/2, width, height);
      textAlign(CENTER);
      fill(255);
      textFont(arial, 30);   
      text("¡GANASTE!", width/2, height/3);
      textFont(arial, 20);  
      text("Derrotaste a la bruja. ", width/2, height/3+30);            

      popStyle();
    }

    //ESTADO DE GAME OVER (PERDISTE)
    if (estado.equals("lost")) {
      pushStyle();
      tint(100, 150, 150);
      image(fondo, width/2, height/2);  
      rectMode(CENTER);
      fill(255, 0, 0, 50);
      rect(width/2, height/2, width, height);
      textAlign(CENTER);
      fill(255);
      textFont(arial, 30);   
      text("¡PERDISTE!", width/2, height/3);
      textFont(arial, 20);  
      text("No has vencido a la bruja.", width/2, height/3+30);   

      popStyle();
    }
  }

  //Descuenta vida de la bruja, y afecta el contador de la pantalla.
  void bmatar() {
    bruja.matar();
    contador.vida-=10;
  }
  void mouse() {
    if (estado.equals("jugar")) {
      //disparo al presionar el mouse en mouseX y mouseY
      dorothy.disparar(mouseX, mouseY, bruja.x, bruja.y, bruja.tx, bruja.ty);
    }
    if (estado.equals("menu")) {    
      if (mouseX>width/7-50 && mouseX<width/7+50 && mouseY >height/2-5-20 && mouseY<height/2-5+20) {
        estado="jugar";
      }
    }
  }
}
