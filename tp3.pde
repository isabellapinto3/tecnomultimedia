String estado;

//Tornado movimiento
float tornx;
//burbuja movimiento
float burby;

//Fuentes
PFont titulo; 
PFont fjugar;

//Contador pantalla3
float contador;
//Contador pantalla4
float contador2;
//contador pantalla 8
float contador3;
//contador pantalla9
float contador4;
//contador pantalla11
float contador5;

//Imagenes
//Fondos
PImage inicio;
PImage castillo;
PImage pantalla2;
PImage pantalla22;
PImage ipantalla3;
PImage muerte1;
PImage pantalla4;
PImage pantalla6;
PImage pantalla7;
PImage muerte2;
PImage pantalla8;
PImage final1;
PImage melting;
PImage sorpresa;
PImage final2;
//Objetos
PImage iburbuja;
PImage tornado;
PImage manzano;
PImage aceite;
PImage agua;
//Personajes
PImage dorothy;
PImage brujabuena;
PImage espantapajaros;
PImage brujamala;
PImage lata;
PImage leon;
PImage dorothynegro;
PImage lataox;


//volver a jugar
boolean vj, vj2,vj3,vj4;

//conversaciones 1
boolean c1, c2, c3, c4, c5, c6, c7, c8, c9, c10;
//reset de conversaciones 1
boolean p1, p2, p3, p4, p5, p6, p7, p8, p9;

//conversaciones 2
boolean k1, k2, k3, k4, k5, k6;
//reset de conversaciones 2
boolean r1, r2, r3, r4, r5, r6;

//conversaciones lata
boolean cl1, cl2, cl3, cl4, cl5;
//reset conversaciones lata
boolean rl1, rl2, rl3, rl4, rl5, rl6;

//conversaciones leon
boolean ca1, ca2, ca3, ca4, ca5, ca6, ca7, ca8;
//reset conversaciones leon
boolean ra1, ra2, ra3, ra4, ra5, ra6, ra7, ra8;

//conversaciones bruja
boolean cb1, cb2, cb3, cb4, cb5, cb6, cb7, cb8;
//reset conversaciones bruja
boolean rb1, rb2, rb3, rb4, rb5, rb6, rb7, rb8;

//burbuja
boolean burbuja;

//FLECHAS
//flecha
boolean flecha;
//flecha manzana
boolean fleman;
//flecha leon
boolean flechaleon;
//flecha 8
boolean flechacastillo;
//flecha camino pantalla 4
boolean seguir;
//flecha lata
boolean flechalata;

//OPCIONES
//camino izquierdo
boolean izq;
boolean der;
//agarrar lata
boolean agarrar;
//desoxidar
boolean desoxidado;
//tirar agua o dar zapatos?

boolean opcion;
//Texto
String jugar;
//creditos 1
float cr1,cr2,cr3,cr4,cr5,cr6,cr7,cr8;

void setup() {
  cr1=width;
  cr2=width+100;
  cr3=width+150;
  cr4=width+200;
  cr5=width+250;
  
  size(800, 600);
  estado= "inicio";
  imageMode(CORNER);

  //Posición burbuja
  burby=300;
  //Posición Tornado
  tornx=-200;

  //Fuentes
  fjugar=  loadFont("ArialMT-30.vlw");
  titulo = loadFont("OzsWizard-Scarecrow-60.vlw");

  //Imagenes fondo
  inicio = loadImage("inicio.jpg");
  pantalla2 = loadImage("pantalla2.png");
  pantalla22 = loadImage("pantalla22.png");
  ipantalla3 = loadImage("pantalla3.png");
  muerte1 = loadImage("muerte1.jpg");
  pantalla4= loadImage("pantalla4.png");
  pantalla6 = loadImage("pantalla6.png");
  pantalla7 = loadImage("pantalla7.png");
  muerte2 = loadImage("muerte2.jpg");
  pantalla8= loadImage("pantalla8.png");
  castillo = loadImage("castillo.jpg");
  final1=loadImage("final1.png");
  melting = loadImage("melting.png");
  sorpresa = loadImage("sorpresa.png");
  final2 = loadImage("final2.jpg");
  //Imagenes objetos
  tornado = loadImage("tornado.png");
  iburbuja = loadImage("burbuja.png");
  aceite = loadImage("aceite.png");
  agua = loadImage("agua.png");
  //Imagenes personajes
  dorothy = loadImage("dorothy.png");
  brujabuena = loadImage("brujabuena.png");
  espantapajaros = loadImage("espantapajaros.png");   
  manzano = loadImage("manzano.png");
  lata = loadImage("lata.png");
  brujamala= loadImage("brujamala.png");
  leon= loadImage("leon.png");
  dorothynegro = loadImage("dorothynegro.png");
  lataox = loadImage("lataox.png");

  //textos
  jugar= "Jugar";
}
void draw() {
  //------------------------------------------------------------------------------------
  //PANTALLA 1
  //INICIO
  if (estado.equals("inicio")) {
    vj=false;
    vj2=false;
    vj3=false;
    vj4=false;
    image(inicio, 0, 0);
    textAlign(CENTER);
    textFont(titulo, 60);
    fill(255);
    text("El Mago de Oz", width/2, height/2-150);

    rectMode(CENTER);
    noStroke();
    fill(255);
    rect(width/2, height/2+200, 150, 50);
    fill(0);
    textAlign(CENTER, CENTER);
    
    textFont(fjugar, 30);
    text(jugar, width/2, height/2+200);

    if (mouseX<width/2+75 && mouseX>width/2-75 && mouseY>height/2+200-25 && mouseY<height/2+200+25) {
      fill(230);
      rect(width/2, height/2+200, 150, 50);
      fill(0);
      textAlign(CENTER, CENTER);
      textFont(fjugar, 30);
      text(jugar, width/2, height/2+200);
    }
  }

  //---------------------------------------------------
  //PANTALLA 2
  //OZ

  if (estado.equals("oz")) {
    //fondo 1
    image(pantalla2, 0, 0);

    //dorothy
    if (tornx>100) {
      image(dorothynegro, width/2, height/2, 100, 200);
    }

    image(brujabuena, width/2+200, height/2-10, 140, 220);
    tornx+=4;
    image(tornado, tornx, -10);

    if (tornx>300) {
      textSize(16);
      fill(255);
      rect(width/2, height-30, 400, 30);
      fill(0);
      text("Haz click al personaje con el que quieras interactuar", width/2, height-30);
    }

    if (tornx>800) {
      tornx+=0;
    }

    //Texto
    if (c1==true) {
      fill(255);
      rect(width/2+100, height/2-50, 300, 50);
      triangle(width/2+50, height/2-125+50, width/2+100, height/2-125+50, width/2+50, height/2);
      fill(0);
      textSize(16);
      text("Donde estoy? Esto no es Kansas. \n Este tornado si que me ha llevado lejos.", width/2+100, height/2-50);
      p1=true;
      fill(255);
      rectMode(CENTER);
      rect(width/2, height-30, 400, 30);
      fill(0);
      text("Haz click en la pantalla para avanzar la conversación", width/2, height-30);
    }

    if (c2==true) {
      c1=false;
      fill(255);
      rect(width/2+200, height/2-50, 200, 50);
      triangle(width/2+200-10, height/2-50+25, width/2+200+20, height/2-50+25, width/2+200+20, height/2);
      fill(0);
      text("Estas en el Reino de Oz", width/2+200, height/2-50);
      p2=true;

      fill(255);
      rectMode(CENTER);
      rect(width/2, height-30, 400, 30);
      fill(0);
      text("Haz click en la pantalla para avanzar la conversación", width/2, height-30);
    }

    if (c3==true) {
      c2=false;
      fill(255);
      rect(width/2+100, height/2-50, 330, 50);
      triangle(width/2+50, height/2-125+50, width/2+100, height/2-125+50, width/2+50, height/2);
      fill(0);
      textSize(16);
      text("Reino de Oz? Qué es eso? Y quien sos vos?",  width/2+100, height/2-50);
      p3=true;
      fill(255);
      rectMode(CENTER);
      rect(width/2, height-30, 400, 30);
      fill(0);
      text("Haz click en la pantalla para avanzar la conversación", width/2, height-30);
    }
    if (c4==true) {
      c3=false;
      fill(255);
      rect(width/2+200, height/2-50, 360, 70);
      triangle(width/2+200-10, height/2-50+25, width/2+200+20, height/2-50+25, width/2+200+20, height/2);
      fill(0);
      text("Yo soy la Bruja Buena, y esas piernas que ves \n abajo de tu casa, pertenecen a la Bruja Mala.\n La mataste.", width/2+200, height/2-50);
      p4=true;

      fill(255);
      rectMode(CENTER);
      rect(width/2, height-30, 400, 30);
      fill(0);
      text("Haz click en la pantalla para avanzar la conversación", width/2, height-30);
    }
    if (c5==true) {
      c4=false;
      fill(255);
      rect(width/2+100, height/2-50, 150, 50);
      triangle(width/2+50, height/2-125+50, width/2+100, height/2-125+50, width/2+50, height/2);
      fill(0);
      textSize(16);
      text("LA MATÉ?!", width/2+100, height/2-50);
      p5=true;
      fill(255);
      rectMode(CENTER);
      rect(width/2, height-30, 400, 30);
      fill(0);
      text("Haz click en la pantalla para avanzar la conversación", width/2, height-30);
    }
    if (c6==true) {
      image(pantalla22, 0, 0);
      image(dorothy, width/2, height/2, 100, 200);
      image(brujabuena, width/2+200, height/2-10, 140, 220);
      c5=false;
      fill(255);
      rect(width/2+200, height/2-50, 400, 60);
      triangle(width/2+200-10, height/2-50+25, width/2+200+20, height/2-50+25, width/2+200+20, height/2);
      fill(0);
      text("Sí! Y en agradecimiento, te podes quedar los zapatos \n Pero no te olvides:La bruja mala tiene una hermana, \n y ella va a hacer lo que sea para recuperarlos.", width/2+200, height/2-50);
      p6=true;

      fill(255);
      rectMode(CENTER);
      rect(width/2, height-30, 400, 30);
      fill(0);
      text("Haz click en la pantalla para avanzar la conversación", width/2, height-30);
    }

    if (c7==true) {
      image(pantalla22, 0, 0);
      image(dorothy, width/2, height/2, 100, 200);
      image(brujabuena, width/2+200, height/2-10, 140, 220);
      c6=false;
      fill(255);
      rect(width/2+200, height/2-50, 350, 50);
      triangle(width/2+200-10, height/2-50+25, width/2+200+20, height/2-50+25, width/2+200+20, height/2);
      fill(0);
      text("NO SE LOS DES! Bueno, ahora me tengo que ir...", width/2+200, height/2-50);
      p7=true;

      fill(255);
      rectMode(CENTER);
      rect(width/2, height-30, 400, 30);
      fill(0);
      text("Haz click en la pantalla para avanzar la conversación", width/2, height-30);
    }
    if (c8==true) {
      image(pantalla22, 0, 0);
      image(dorothy, width/2, height/2, 100, 200);
      image(brujabuena, width/2+200, height/2-10, 140, 220);
      c7=false;
      fill(255);
      rect(width/2+100, height/2-50, 340, 50);
      triangle(width/2+50, height/2-125+50, width/2+100, height/2-125+50, width/2+50, height/2);
      fill(0);
      textSize(16);
      text("Irte? Nono, espera! como vuelvo yo a casa?",  width/2+100, height/2-50);
      p8=true;
      fill(255);
      rectMode(CENTER);
      rect(width/2, height-30, 400, 30);
      fill(0);
      text("Haz click en la pantalla para avanzar la conversación", width/2, height-30);
    }
    if (c9==true) {
      image(pantalla22, 0, 0);
      image(dorothy, width/2, height/2, 100, 200);
      image(brujabuena, width/2+200, height/2-10, 140, 220);
      c8=false;
      fill(255);
      rect(width/2+200, height/2-50, 300, 50);
      triangle(width/2+200-10, height/2-50+25, width/2+200+20, height/2-50+25, width/2+200+20, height/2);
      fill(0);
      text("Eso es lo más fácil!\n Solo tenes que seguir el camino amarillo", width/2+200, height/2-50);
      p9=true;

      fill(255);
      rectMode(CENTER);
      rect(width/2, height-30, 400, 30);
      fill(0);
      text("Haz click en la pantalla para avanzar la conversación", width/2, height-30);
    }

    if (burbuja==true) {
      burby-=5;
      image(pantalla22, 0, 0);
      image(dorothy, width/2, height/2, 100, 200);
      image(iburbuja, width/2+80, burby, 200, 200);

      if (burby<0) {
        flecha=true;
        fill(255);
        rect(width-100, height-150, 60, 20);
        triangle(width-100+30, height-180, width-100+30, height-120, width-40, height-150);
      }
    }
  }

  //--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  //-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  //---------------------------------------------------PANTALLA 3-----------------------------------------------------------------------
  if (estado.equals("pantalla3")) {
    println(contador);
    contador+=0.3;
    imageMode(CORNER);
    image(ipantalla3, 0, 0);
    imageMode(CENTER);
    image(espantapajaros, width/2, height/3, 100, 200);
    image(dorothy, width/2, height/2+200, 100, 200);
    textSize(16);
      fill(255);
      rect(width/2, height-30, 400, 30);
      fill(0);
      text("Haz click al personaje con el que quieras interactuar", width/2, height-30);


    if (contador>1 && contador <50) {
      
      fill(255);
      rectMode(CENTER);
      rect(width/2+100, height/2+50, 200, 50);
      fill(0);
      text("Y ahora para que lado voy?", width/2+100, height/2+50);
    }


    if (k1==true) {
      fill(255);
      rectMode(CENTER);
      rect(width/2, height-30, 400, 30);
      fill(0);
      text("Haz click en la pantalla para avanzar la conversación", width/2, height-30);
      fill(255);
      rectMode(CENTER);
      rect(width/2+150, height/4-50, 250, 50);
      fill(0);
      text("Hola, yo te puedo ayudar,\n me se estos caminos de memoria", width/2+150, height/4-50);
      r1=true;
    }
    if (k2==true) {
      fill(255);
      rectMode(CENTER);
      rect(width/2, height-30, 400, 30);
      fill(0);
      text("Haz click en la pantalla para avanzar la conversación", width/2, height-30);
      k1=false;
      fill(255);
      rectMode(CENTER);
      rect(width/2+100, height/2+50, 250, 50);
      fill(0);
      text("¡Sí! Necesito saber como llegar al \n castillo de la bruja mala", width/2+100, height/2+50);
      r2=true;
    }

    if (k3==true) {
      fill(255);
      rectMode(CENTER);
      rect(width/2, height-30, 400, 30);
      fill(0);
      text("Haz click en la pantalla para avanzar la conversación", width/2, height-30);
      k2=false;
      fill(255);
      rectMode(CENTER);
      rect(width/2+150, height/4-50, 250, 50);
      fill(0);
      text("Ah, fácil! Hacia la derecha... \n Te molestaría si te acompaño?", width/2+150, height/4-50);
      r3=true;
    }
    if (k4==true) {
      fill(255);
      rectMode(CENTER);
      rect(width/2, height-30, 400, 30);
      fill(0);
      text("Haz click en la pantalla para avanzar la conversación", width/2, height-30);
      k3=false;
      fill(255);
      rectMode(CENTER);
      rect(width/2+100, height/2+50, 300, 50);
      fill(0);
      text("Para nada! Me vendría bien la compañía \n Vamos!", width/2+100, height/2+50);
      r4=true;
      r5=true;
      //flecha derecha
      rect(width-100, height/2, 70, 20);
      triangle(width-100+35, height/2-30, width-100+35, height/2+30, width-100+60, height/2);
      //flecha izquierda
      rect(100, height/2, 70, 20);
      triangle(100-35, height/2-30, 100-35, height/2+30, 100-60, height/2);
    }
    //MUERTE 1 VOLVER A JUGAR
    if (izq==true) {
      k4=false;
      r5=false;
      imageMode(CORNER);
      image(muerte1, 0, 0, width, height);
      fill(255);
      text("GAME OVER", width/2, height/2-100);
      text("¡El espantapajaros te dijo que era para la derecha!", width/2, height/2);
      contador=0;
      rect(width/2, height-100, 150, 50);
      fill(0);
      text("Volver a jugar", width/2, height-100);
      vj=true;
    }
  }

  //--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  //-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  //---------------------------------------------------PANTALLA 4-----------------------------------------------------------------------
  if (estado.equals("pantalla4")) {
    imageMode(CORNER);
    image(pantalla4, 0, 0);
    image(manzano, 0, 0, 150, 180);
    image(manzano, 50, 10, 150, 180);
    image(manzano, 200, 10, 150, 180);
    image(manzano, 100, 15, 150, 180);
    
    contador=0;
    contador2+=0.3;
    image(espantapajaros, width/3, height-300, 100, 200);
    image(dorothy, width/3-100, height-300, 100, 200);
    if (contador2>1 && contador2 <35) {
      fill(255);
      rectMode(CENTER);
      rect(100, height/2-30, 200, 50);
      fill(0);
      textSize(16);
      text("¡Manzanas! Que hambre. \n Vamos, busquemos algunas", 100, height/2-30);
    }
    if (contador2>35 && contador2 <65) {
      fill(255);
      rectMode(CENTER);
      rect(width/2-100, height/2-30, 300, 50);
      fill(0);
      textSize(16);
      text("No sé Dorothy...mejor seguir camino", width/2-100, height/2-30);
    }
    if (contador2>65 && contador2 <85) {
      fill(255);
      rectMode(CENTER);
      rect(100, height/2-30, 100, 50);
      fill(0);
      textSize(16);
      text("Mmm...", 100, height/2-30);
    }
    if (contador2>85) {
      fleman=true;
      fill(0);
      rectMode(CENTER);
      rect(width/3-100, height/3+70, 20, 50);
      triangle(width/3-120, height/3+70-25, width/3-80, height/3+70-25, width/3-100, height/3+70-45);
      seguir=true;
      rect(width-100, height-200, 70, 20);
      triangle(width-100+35, height-200-30, width-100+35, height-200+30, width-100+60, height-200);
    }
  }


  //--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  //-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  //---------------------------------------------------PANTALLA 5 MUERTE 2 ARBOLES-----------------------------------------------------------------------
  if (estado.equals("pantalla5")) {
    image(muerte2, 0, 0, 800, 600);
    fill(255);
    rect(width/2, height-100, 150, 50);
    rect(width/2,height/2-200,width-150,60);
    textSize(30);
    fill(0);
    text("A los arboles de Oz no les gusta ser molestados", width/2, height/2-200);
    textSize(20);
    fill(0);

    text("Volver a jugar", width/2, height-100);
    vj2=true;
  }
  //--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  //-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  //---------------------------------------------------PANTALLA 6: HOMBRE DE LATA-----------------------------------------------------------------------
  if (estado.equals("pantalla6")) {
    image(pantalla6, 0, 0);
    image(espantapajaros, width/3, height-300, 100, 200);
    image(dorothy, width/3-100, height-300, 100, 200);

    image(lataox, width/3+200, height/2-50, 100, 200);
    textSize(16);
    fill(255);
    rect(width/2, height-30, 400, 30);
    fill(0);
    text("Haz click al personaje con el que quieras interactuar", width/2, height-30);



    if (agarrar==false) {
      image(aceite, width/3+150, height/2+100, 50, 70);
    }

    if (cl1==true) {
      fill(255);
      rect(100, height/2, 100, 40);
      fill(0);
      textSize(16);
      text("¿Hola?", 100, height/2);
      rl1=true;
      fill(255);
      rectMode(CENTER);
      rect(width/2, height-30, 400, 30);
      fill(0);
      text("Haz click en la pantalla para avanzar la conversación", width/2, height-30);
    }

    if (cl2==true) {
      cl1=false;
      fill(255);
      rect(width/2-100, height/2-50, 200, 40);
      fill(0);
      textSize(16);
      text("Creo que no puede hablar,\n está muy oxidado.", width/2-100, height/2-50);
      rl2=true;
      fill(255);
      rectMode(CENTER);
      rect(width/2, height-30, 400, 30);
      fill(0);
      text("Haz click en la pantalla para avanzar la conversación", width/2, height-30);
    }

    if (cl3==true) {
      cl2=false;
      fill(255);
      rect(100, height/2, 200, 40);
      fill(0);
      textSize(16);
      text("¡Ahí! Aceite. Puede ser útil.", 100, height/2);
      rl3=true;
      fill(255);
      rectMode(CENTER);
      rect(width/2, height-30, 400, 30);
      fill(0);
      text("Haz click en la pantalla para avanzar la conversación", width/2, height-30);
    }
    if (agarrar==true) {
      stroke(0);
      strokeWeight(2);
      fill(255);
      rectMode(CORNER);
      rect(0, 0, 100, 100);
      rectMode(CENTER);
      noStroke();
      image(aceite, 25, 20, 50, 70);
    }

    if (desoxidado==true) {
      image(pantalla6, 0, 0);
      image(espantapajaros, width/3, height-300, 100, 200);
      image(dorothy, width/3-100, height-300, 100, 200);
      image(lata, width/3+200, height/2-50, 100, 200);
      cl4=true;
    }

    if (cl4==true) {
      image(pantalla6, 0, 0);
    image(espantapajaros, width/3, height-300, 100, 200);
    image(dorothy, width/3-100, height-300, 100, 200);
    image(lata, width/3+200, height/2-50, 100, 200);
      fill(255);
      rect(width/3+200, height/2-100, 300, 50);
      fill(0);
      text("¡Gracias! Hacia meses que no me movia. \n En agradecimiento dejenme acompañarlos ", width/3+200, height/2-100);
      rl4=true;
      
    }

    if (rl4==true) {
      fill(255);
      rect(width-100, height-250, 60, 20);
      triangle(width-100+30, height-280, width-100+30, height-220, width-40, height-250);
      flechalata=true;
    }
  }
  //--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  //-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  //---------------------------------------------------PANTALLA 7: LEÓN-----------------------------------------------------------------------

  if (estado.equals("pantalla7")) {
    image(pantalla7, 0, 0);
    image(espantapajaros, width/3, height-300, 100, 200);
    image(dorothy, width/3-100, height-300, 100, 200);
    image(lata, width/3+100, height-300, 100, 200);
    imageMode(CORNER);
    image(leon, width/2+50, height/2-100, 100, 170);
    textSize(16);
    fill(255);
    rect(width/2, height-30, 400, 30);
    fill(0);
    text("Haz click al personaje con el que quieras interactuar", width/2, height-30);

    if (ca1==true) {
      textSize(16);
      fill(255);
      rect(width/3-50, height/2-50, 250, 70);
      fill(0);
      text("Hola! ¿Qué tal?, de casualidad \n sabes cuanto falta para el \n castillo de la Bruja Mala?", width/3-50, height/2-50);
      ra1=true;
      fill(255);
      rectMode(CENTER);
      rect(width/2, height-30, 400, 30);
      fill(0);
      text("Haz click en la pantalla para avanzar la conversación", width/2, height-30);
    }

    if (ca2==true) {
      ca1=false;
      fill(255);
      rect(width/2, height/2-100, 200, 50);
      fill(0);
      text("El ca-castillo? \n Están yendo hacía allá?", width/2, height/2-100);
      ra2=true;
      fill(255);
      rectMode(CENTER);
      rect(width/2, height-30, 400, 30);
      fill(0);
      text("Haz click en la pantalla para avanzar la conversación", width/2, height-30);
    }

    if (ca3==true) {
      ca2=false;
      textSize(16);
      fill(255);
      rect(width/3-50, height/2-50, 200, 40);
      fill(0);
      text("Sí, por? queres venir?", width/3-50, height/2-50);
      ra3=true;
      fill(255);
      rectMode(CENTER);
      rect(width/2, height-30, 400, 30);
      fill(0);
      text("Haz click en la pantalla para avanzar la conversación", width/2, height-30);
    }

    if (ca4==true) {
      ca3=false;
      fill(255);
      rect(width/2, height/2-100, 50, 40);
      fill(0);
      text("¡NO!", width/2, height/2-100);
      ra4=true;
      fill(255);
      rectMode(CENTER);
      rect(width/2, height-30, 400, 30);
      fill(0);
      text("Haz click en la pantalla para avanzar la conversación", width/2, height-30);
    }
    if (ca5==true) {
      ca4=false;
      textSize(16);
      fill(255);
      rect(width/3-50, height/2-50, 250, 40);
      fill(0);
      text("Nos vendría bien la compañía.", width/3-50, height/2-50);
      ra5=true;
      fill(255);
      rectMode(CENTER);
      rect(width/2, height-30, 400, 30);
      fill(0);
      text("Haz click en la pantalla para avanzar la conversación", width/2, height-30);
    }
    if (ca6==true) {
      ca5=false;
      fill(255);
      rect(width/2, height/2-100, 100, 40);
      fill(0);
      text("Pe-pero...", width/2, height/2-100);
      ra6=true;
      fill(255);
      rectMode(CENTER);
      rect(width/2, height-30, 400, 30);
      fill(0);
      text("Haz click en la pantalla para avanzar la conversación", width/2, height-30);
    }
    if (ca7==true) {
      ca6=false;
      textSize(16);
      fill(255);
      rect(width/3-50, height/2-50, 300, 40);
      fill(0);
      text("Por favor? Solo quiero volver a casa.", width/3-50, height/2-50);
      ra7=true;
      fill(255);
      rectMode(CENTER);
      rect(width/2, height-30, 400, 30);
      fill(0);
      text("Haz click en la pantalla para avanzar la conversación", width/2, height-30);
    }
    if (ca8==true) {
      ca7=false;
      fill(255);
      rect(width/2, height/2-100, 300, 50);
      fill(0);
      text("...Bueno, supongo que si vamos todos \n juntos estaremos todos más seguros.", width/2, height/2-100);
      ra8=true;
      fill(255);
      rectMode(CENTER);
      rect(width/2, height-30, 400, 30);
      fill(0);
      text("Haz click en la pantalla para avanzar la conversación", width/2, height-30);
    }
    if (ra8==true) {
      c7=false;
      rect(width-150, height/2, 20, 60);
      triangle(width-150-30, height/2-30, width-150+30, height/2-30, width-150, height/2-60);
      flechaleon=true;
    }
  }

  //--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  //-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  //---------------------------------------------------PANTALLA 8: CASTILLO-----------------------------------------------------------------------
  if (estado.equals("pantalla8")) {
    contador3+=0.01;
    image(pantalla8, 0, 0);
    image(espantapajaros, width/3, height-300, 100, 200);
    image(dorothy, width/3-100, height-300, 100, 200);
    image(lata, width/3+100, height-300, 100, 200);
    image(leon, width/3+180, height-280, 130, 210);

    if (contador3>0.2 && contador3<1.2) {
      fill(255);
      rect(width/3-140, height/2-50, 200, 50);
      fill(0);
      textSize(16);
      text("Bueno...Llegamos", width/3-140, height/2-50);
    }
    if (contador3>1.3 && contador3<2.5) {
      fill(255);
      rect(width/3+100, height/2-50, 200, 50);
      fill(0);
      textSize(16);
      text("Dorothy, ¿Estas  segura \n que queres entrar?", width/3+100, height/2-50);
    }
    if (contador3>2.6 && contador3<3.6) {
      fill(255);
      rect(width/3-140, height/2-50, 200, 50);
      fill(0);
      textSize(16);
      text("Sí, solo quiero \n volver a casa", width/3-140, height/2-50);
      flechacastillo=true;
    }
    if (flechacastillo==true) {
      fill(255);
      rect(width/2+100, height/2, 20, 60);
      triangle(width/2+100-25, height/2-30, width/2+100+25, height/2-30, width/2+100, height/2-55);
    }
  }

  //--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  //-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  //---------------------------------------------------PANTALLA 7:BRUJA-----------------------------------------------------------------------

  if (estado.equals("pantalla9")) {
    image(castillo, 0, 0, 800, 600);
    image(brujamala, width/3-100, height-300, 130, 250);
    image(espantapajaros, width/2+100, height-290, 100, 200);
    image(dorothy, width/2, height-290, 100, 200);
    image(lata, width/2+180, height-290, 100, 200);
    image(leon, width/2+260, height-280, 130, 210);
    image(agua, width/2-30, height/2+150, 50, 90);
    textSize(16);
    fill(255);
    rect(width/2, height-30, 400, 30);
    fill(0);
    text("Haz click al personaje con el que quieras interactuar", width/2, height-30);

    if (cb1==true) {
      fill(255);
      rect(width/3-100, height/2-50, 250, 60);
      fill(0);
      textSize(16);
      text("¡Ah bueno! ¡Mira quien apareció! \n La Asesina de Brujas", width/3-100, height/2-50);
      rb1=true;
    }
    if (cb2==true) {
      cb1=false;
      fill(255);
      rect(width/2, height/2-50, 150, 50);
      fill(0);
      textSize(16);
      text("¡Fue un accidente!", width/2, height/2-50);
      rb2=true;
    }

    if (cb3==true) {
      cb1=false; 
      cb2=false;
      fill(255);
      rect(width/3-100, height/2-50, 250, 60);
      fill(0);
      textSize(16);
      text("¿Accidente? ¡JA! \n encima tenes la cara de \n usar sus zapatos. DAMELOS.", width/3-100, height/2-50);
      rb3=true;
    }

    if (cb4==true) {
      cb3=false;
      fill(255);
      rect(width/2, height/2-50, 150, 50);
      fill(0);
      textSize(16);
      text("No, ¡no puedo!", width/2, height/2-50);
      rb4=true;
    }

    if (cb5==true) {
      cb4=false;
      fill(255);
      rect(width/3-100, height/2-100, 250, 100);
      fill(0);
      textSize(16);
      text("Mirá mocosa, hagamos un trato, \n vos me das los zapatos y \n yo misma me aseguraré \n que vuelvas a casa. ", width/3-100, height/2-100);
      rb5=true;
    }
    if (cb6==true) {
      contador4+=0.01;
      cb5=false;

      if (contador4>0 && contador4<0.7) {
        fill(255);
        rect(width/2, height/2-50, 150, 50);
        fill(0);
        textSize(16);
        text("No sé...", width/2, height/2-50);
      }
      opcion=true;

      if (opcion==true) {
        image(castillo, 0, 0, 800, 600);
    image(brujamala, width/3-100, height-300, 130, 250);
    image(espantapajaros, width/2+100, height-290, 100, 200);
    image(dorothy, width/2, height-290, 100, 200);
    image(lata, width/2+180, height-290, 100, 200);
    image(leon, width/2+260, height-280, 130, 210);
    image(agua, width/2-30, height/2+150, 50, 90);
        fill(255);
        rect(width/2+50, height-50, 150, 50);
        //rect(width/2+250,height-50,150,50);
        fill(0);
        textSize(16);
        text("Dar Zapatos", width/2+50, height-50);
        fill(255);
        rect(width/2+250, height-50, 150, 50);
        fill(0);
        textSize(16);
        text("Tirar baldazo \n de agua", width/2+250, height-50, 150, 50);
        
      }
    }
  }
  //--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  //-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  //---------------------------------------------------PANTALLA 10:final 1-----------------------------------------------------------------------
  if (estado.equals("pantalla10")) {
    image(final1, 0, 0);
    fill(255);
    textFont(titulo, 60);
    text("GAME OVER", width/2-200, 50);
    textFont(fjugar, 30);
    textSize(20);
    text("Nunca confies en una bruja", width/2-200, height/2+150);

    rect(width/2, height-100, 150, 50);
    fill(0);
    text("Créditos", width/2, height-100);

    if (mouseX>width/2-75 && mouseX<width/2+75 && mouseY>height-100-25 && mouseY<height-100+25) {
      fill(220);
      rect(width/2, height-100, 150, 50);
      fill(0);
      text("Créditos", width/2, height-100);
    }
  }
  //--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  //-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  //---------------------------------------------------PANTALLA 11:derretida-----------------------------------------------------------------------
  if (estado.equals("pantalla11")) {
    contador+=0.01;
    if(contador>0 && contador<2.5){
    image(sorpresa, -200, 0);
    image(melting, width/2, 0, 400, 600);
    textSize(30);
    fill(255);
    rect(width/2,70,width-150,60);
    fill(0);
    text("¡Qué casualidad! El agua es letal para las brujas.", width/2, 70);}
    
    if(contador>2.5){
          image(final2, 0, 0,width,height);
    fill(255);
    rect(width/2, height-100, 150, 50);
    fill(0);
    text("GAME OVER", width/2, height/2-200);
    fill(255);
    text("Dorothy regresó a su hogar", width/2, height/2);
    fill(0);
    text("Créditos", width/2, height-100);

    if (mouseX>width/2-75 && mouseX<width/2+75 && mouseY>height-100-25 && mouseY<height-100+25) {
      fill(220);
      rect(width/2, height-100, 150, 50);
      fill(0);
      text("Créditos", width/2, height-100);
    }
    
    }}
  
  //--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  //-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  //---------------------------------------------------PANTALLA 12:final 2-----------------------------------------------------------------------
  //if (estado.equals("pantalla12")) {

  //  image(final2, 0, 0);
  //  fill(255);
  //  rect(width/2, height-100, 150, 50);
  //  fill(0);
  //  text("GAME OVER", width/2, height/2-200);
  //  fill(255);
  //  text("Dorothy regresó a su hogar", width/2, height/2);
  //  fill(0);
  //  text("Créditos", width/2, height-100);

  //  if (mouseX>width/2-75 && mouseX<width/2+75 && mouseY>height-100-25 && mouseY<height-100+25) {
  //    fill(220);
  //    rect(width/2, height-100, 150, 50);
  //    fill(0);
  //    text("Créditos", width/2, height-100);
  //  }
  //}

  //--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  //-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  //---------------------------------------------------PANTALLA 13: CRÉDITOS-----------------------------------------------------------------------

  if (estado.equals("creditos")) {
    cr1-=1;cr2-=1;cr3-=1;cr4-=1;cr5-=1;
    background(0);
    fill(255);
    textFont(titulo, 60);
    
    text("El Mago de Oz", width/2, cr1);
    textFont(fjugar, 30);
    text("Isabella Pinto",width/2,cr2);
    text("Tecnología Multimedial",width/2,cr3);
    text("2020",width/2,cr4);
    
    if(cr4<0){
      rect(width/2, height-100, 200, 50);
      fill(0);
      text("Volver a jugar", width/2, height-100);
      vj3=true;
    }
  }


//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//_________________________________________________________MOUSE PRESSED________________________________________________________________________________________________//
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
}
void mousePressed() {
  //--------------------------------------------PANTALLA 1
  if (estado.equals("inicio")) {
    if (mouseX<width/2+75 && mouseX>width/2-75 && mouseY>height/2+200-25 && mouseY<height/2+200+25) {
      estado="oz";
    }
  }
  //------------------------------------------------PANTALLA 2
  if (estado.equals("oz")) {

    //Comenzar conversación
    if (mouseX>width/2+200 && mouseX<width/2+200+140 && mouseY>height/2-10 && mouseY<height/2-10+220) {
      c1=true;
    }


    if (p1==true && mouseX>0 && mouseX<width && mouseY>0 && mouseY<height) {
      c2=true;
    }

    if (p2==true && mouseX>0 && mouseX<width && mouseY>0 && mouseY<height) {
      c3=true;
    }

    if (p3==true && mouseX>0 && mouseX<width && mouseY>0 && mouseY<height) {
      c4=true;
    }
    if (p4==true && mouseX>0 && mouseX<width && mouseY>0 && mouseY<height) {
      c5=true;
    }
    if (p5==true && mouseX>0 && mouseX<width && mouseY>0 && mouseY<height) {
      c6=true;
    }
    if (p6==true && mouseX>0 && mouseX<width && mouseY>0 && mouseY<height) {
      c7=true;
    }
    if (p7==true && mouseX>0 && mouseX<width && mouseY>0 && mouseY<height) {
      c8=true;
    }
    if (p8==true && mouseX>0 && mouseX<width && mouseY>0 && mouseY<height) {
      c9=true;
    }
    if (p9==true && mouseX>0 && mouseX<width && mouseY>0 && mouseY<height) {
      burbuja=true;
    }


    //FLECHA

    if (flecha==true && mouseX>width-130 && mouseX<width-40 && mouseY>height-180 && mouseY<height-120) {
      estado="pantalla3";
    }
  }

  //-------------------------------------------------------------------PANTALLA 3

  //INTERACTUAR CON ESPANTAPAJAROS
  if (estado.equals("pantalla3")) {

    if (mouseX>width/2-50 && mouseX<width/2+50 && mouseY>height/3-100 && mouseY<height/3+100) {
      k1=true;
    }

    if (r1==true && mouseX>0 && mouseX<width && mouseY>0 && mouseY<height) {
      k2=true;
    }
    if (r2==true && mouseX>0 && mouseX<width && mouseY>0 && mouseY<height) {
      k3=true;
    }
    if (r3==true && mouseX>0 && mouseX<width && mouseY>0 && mouseY<height) {
      k4=true;
    }

    //IZQUIERDA
    //flecha derecha
      //rect(width-100, height/2, 70, 20);
      //triangle(width-100+35, height/2-30, width-100+35, height/2+30, width-100+60, height/2);
    if (r4==true) {
      if (mouseX>100-60 && mouseX<100+35 && mouseY>height/2-30 && mouseY<height/2+30) {
        izq=true;
      }
    }
    //DERECHA      
    if (r5==true) {
      if (mouseX>width-100-35 && mouseX<width-100+60 && mouseY>height/2-30 && mouseY<height/2+30) {
        estado="pantalla4";
      }
    } 

    //VOLVER A JUGAR
    if (vj==true) {
      if (mouseX>width/2-75 && mouseX<width/2+75 && mouseY>height-100-25 && mouseY<height-100+25) {
        estado="inicio";
        r4=false;      
        izq=false;
        c1=false;
        c2=false;
        c3=false;
        c4=false;
        c5=false;
        c6=false;
        c7=false;
        c8=false;
        c9=false;
        c10=false;
        p1=false;
        p2=false;
        p3=false;
        p4=false;
        p5=false;
        p6=false;
        p7=false;
        p8=false;
        p9=false;
        k1=false;
        k2=false;
        k3=false;
        k4=false;
        k5=false;
        k6=false;
        r1=false;
        r2=false;
        r3=false;
        r4=false;
        r5=false;
        r6=false;
        burbuja=false;
        burby=300;
        tornx=-200;
        flecha=false;
        contador=0;
      }
    }
  }

  //--------------------------------------Pantalla 4
  if (estado.equals("pantalla4")) {

    if (fleman==true &&  mouseX>width/3-120 && mouseX<width/3-80 && mouseY>height/3+70-45 && mouseY<height/3+70+25) {
      estado="pantalla5";
    }

    if (seguir==true && mouseX>width-100-35 && mouseX<width-100+60 && mouseY>height-200-30 && mouseY<height-200+30) {
      estado="pantalla6";
    }
  }

  //---------------------------------------Pantalla 5
  if (estado.equals("pantalla5")) {
    if (vj2==true && mouseX>width/2-75 && mouseX<width/2+75 && mouseY>height-100-25 && mouseY<height-100+25) {
      estado="inicio";
      r4=false;      
      izq=false;
      c1=false;
      c2=false;
      c3=false;
      c4=false;
      c5=false;
      c6=false;
      c7=false;
      c8=false;
      c9=false;
      c10=false;
      p1=false;
      p2=false;
      p3=false;
      p4=false;
      p5=false;
      p6=false;
      p7=false;
      p8=false;
      p9=false;
      k1=false;
      k2=false;
      k3=false;
      k4=false;
      k5=false;
      k6=false;
      r1=false;
      r2=false;
      r3=false;
      r4=false;
      r5=false;
      r6=false;
      burbuja=false;
      burby=300;
      tornx=-200;
      flecha=false;
      contador=0;
      contador2=0;
      fleman=false;
      seguir=false;
    }
  }


  //----------------------------------------------------PANTALLA 6
  if (estado.equals("pantalla6")) {
    if (mouseX>width/3+200 && mouseX<width/3+300 && mouseY>height/2-50 && mouseY<height/2-50+200) {
      cl1=true;
    }
    if (rl1==true && mouseX>0 && mouseX<width && mouseY>0 && mouseY<height) {
      cl2=true;
    }
    if (rl2==true && mouseX>0 && mouseX<width && mouseY>0 && mouseY<height) {
      cl3=true;
    }
    if (rl3==true && mouseX>width/3+150 && mouseX<width/3+200 && mouseY>height/2+100 && mouseY<height/2+170) {
      agarrar=true;
    }

    if (agarrar==true && mouseX>width/3+200 && mouseX<width/3+300 && mouseY>height/2-50 && mouseY<height/2-50+200) {
      desoxidado=true;
    }

    if (flechalata==true && mouseX>width-100 && mouseX<width-40 && mouseY>height-280 && mouseY<height-220) {
      estado="pantalla7";
    }
  }

  //----------------------------------------------------PANTALLA 7
  if (estado.equals("pantalla7")) {
    if (mouseX>width/2+50 && mouseX<width/2+50+100 && mouseY>height/2-100 && mouseY<height/2-100+170) {
      ca1=true;
    }

    if (ra1==true && mouseX>0 && mouseX<width && mouseY>0 && mouseY<height) {
      ca2=true;
    }

    if (ra2==true && mouseX>0 && mouseX<width && mouseY>0 && mouseY<height) {
      ca3=true;
    }

    if (ra3==true && mouseX>0 && mouseX<width && mouseY>0 && mouseY<height) {
      ca4=true;
    }
    if (ra4==true && mouseX>0 && mouseX<width && mouseY>0 && mouseY<height) {
      ra3=false;
      ra2=false;
      ra1=false;
      ca5=true;
    }
    if (ra5==true && mouseX>0 && mouseX<width && mouseY>0 && mouseY<height) {
      ca6=true;
    }
    if (ra6==true && mouseX>0 && mouseX<width && mouseY>0 && mouseY<height) {
      ca7=true;
    }
    if (ra7==true && mouseX>0 && mouseX<width && mouseY>0 && mouseY<height) {
      ca8=true;
      ca7=false;
      ca6=false;
      ca5=false;
      ca4=false;
      ca3=false;
      ca2=false;
      ca1=false;
    }

    if (flechaleon==true && mouseX>width-150-30 && mouseX<width-150+30 && mouseY>height/2-60 && mouseY<height/2+30) {
      estado="pantalla8";
    }

    //----------------------------pantalla 8
  }
  if (estado.equals("pantalla8")) {
    if (flechacastillo==true && mouseX>width/2+100-25 && mouseX<width/2+100+25 && mouseY>height/2-55 && mouseY<height/2+30) {
      estado="pantalla9";
    }
  }

  //------------------------pantalla 9
  if (estado.equals("pantalla9")) {
    if (mouseX>width/3-100 && mouseX<width/3-100+130 && mouseY>height-300 && mouseY<height-300+250) {
      cb1=true;
    }

    if (rb1==true && mouseX>0 && mouseX<width && mouseY>0 && mouseY<height) {
      cb2=true;
    }

    if (rb2==true && mouseX>0 && mouseX<width && mouseY>0 && mouseY<height) {
      cb3=true;
    }
    if (rb3==true && mouseX>0 && mouseX<width && mouseY>0 && mouseY<height) {
      cb4=true;
    }
    if (rb4==true && mouseX>0 && mouseX<width && mouseY>0 && mouseY<height) {
      cb5=true;
    }
    if (rb5==true && mouseX>0 && mouseX<width && mouseY>0 && mouseY<height) {
      cb6=true;
    }
    //rect(width/2+50,height-50,150,50);
    //rect(width/2+250,height-50,150,50);
    //DAR ZAPATOS
   if (opcion==true && mouseX>width/2+50-75 && mouseX<width/2+50+75 && mouseY>height-50-25 && mouseY<height-50+25) {
      estado="pantalla10";
    }
     //Tirar agua
    if (opcion==true && mouseX>width/2+250-75 && mouseX<width/2+250+75 && mouseY>height-50-25 && mouseY<height-50+25) {
      estado="pantalla11";
    }
   
  }
    
//.-----pantalla 10
  if (estado.equals("pantalla10")) {
    if (mouseX>width/2-75 && mouseX<width/2+75 && mouseY>height-100-25 && mouseY<height-100+25) {
      estado="creditos";
    }
  }
//--------pantalla11
  if (estado.equals("pantalla11")) {
    if (mouseX>width/2-75 && mouseX<width/2+75 && mouseY>height-100-25 && mouseY<height-100+25) {

      estado="pantalla12";
    }
  }

if (estado.equals("pantalla12")) {
    if(mouseX>width/2-75 && mouseX<width/2+75 && mouseY>height-100-25 && mouseY<height-100+25){
      estado="creditos";}
    
  }


//------créditos
if(estado.equals("creditos")){
  if(vj3==true){
    estado="inicio";
    c1=false;
    c2=false;
    c3=false;
    c4=false;
    c5=false;
    c6=false;
    c7=false;
    c8=false;
    c9=false;
    c10=false;
    p1=false;
    p2=false;
    p3=false;
    p4=false;
    p5=false;
    p6=false;
    p7=false;
    p8=false;
    p9=false;
    k1=false;
    k2=false;
    k3=false;
    k4=false;
    k5=false;
    k6=false;
    r1=false;
    r2=false;
    r3=false;
    r4=false;
    r5=false;
    r6=false;
    cl1=false;
    cl2=false;
    cl3=false;
    cl4=false;
    cl5=false;
    rl1=false;
    rl2=false;
    rl3=false;
    rl4=false;
    rl5=false;
    rl6=false;
    ca1=false;
    ca2=false;
    ca3=false;
    ca4=false;
    ca5=false;
    ca6=false;
    ca7=false;
    ca8=false;
    ra1=false;
    ra2=false;
    ra3=false;
    ra4=false;
    ra5=false;
    ra6=false;
    ra7=false;
    ra8=false;
    cb1=false;
    cb2=false;
    cb3=false;
    cb4=false;
    cb5=false;
    cb6=false;
    cb7=false;
    cb8=false;
    rb1=false;
    rb2=false;
    rb3=false;
    rb4=false;
    rb5=false;
    rb6=false;
    rb7=false;
    rb8=false;
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
    cr1=width;
    cr2=width+100;
    cr3=width+150;
    cr4=width+200;
    cr5=width+250;
    tornx=-200;
    burby=300;
    contador=0;
    contador2=0;
    contador3=0;
    contador4=0;
    contador5=0;
      
  }
  if(vj4==true){
      estado="inicio";
    c1=false;
    c2=false;
    c3=false;
    c4=false;
    c5=false;
    c6=false;
    c7=false;
    c8=false;
    c9=false;
    c10=false;
    p1=false;
    p2=false;
    p3=false;
    p4=false;
    p5=false;
    p6=false;
    p7=false;
    p8=false;
    p9=false;
    k1=false;
    k2=false;
    k3=false;
    k4=false;
    k5=false;
    k6=false;
    r1=false;
    r2=false;
    r3=false;
    r4=false;
    r5=false;
    r6=false;
    cl1=false;
    cl2=false;
    cl3=false;
    cl4=false;
    cl5=false;
    rl1=false;
    rl2=false;
    rl3=false;
    rl4=false;
    rl5=false;
    rl6=false;
    ca1=false;
    ca2=false;
    ca3=false;
    ca4=false;
    ca5=false;
    ca6=false;
    ca7=false;
    ca8=false;
    ra1=false;
    ra2=false;
    ra3=false;
    ra4=false;
    ra5=false;
    ra6=false;
    ra7=false;
    ra8=false;
    cb1=false;
    cb2=false;
    cb3=false;
    cb4=false;
    cb5=false;
    cb6=false;
    cb7=false;
    cb8=false;
    rb1=false;
    rb2=false;
    rb3=false;
    rb4=false;
    rb5=false;
    rb6=false;
    rb7=false;
    rb8=false;
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
    cr1=width;
    cr2=width+100;
    cr3=width+150;
    cr4=width+200;
    cr5=width+250;
    tornx=-200;
    burby=300;
    contador=0;
    contador2=0;
    contador3=0;
    contador4=0;
    contador5=0;
    vj=false;
    vj2=false;
    
  }
}
}
