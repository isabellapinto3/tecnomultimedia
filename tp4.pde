//sonido importación
import processing.sound.*;
SoundFile file;

String estado;

//Tornado movimiento
float tornx;
//burbuja movimiento
float burby;

//Fuentes
PFont titulo; 
PFont fjugar;

float [] contador;

//Imagenes
//flecha
PImage flechab;
PImage flechai;

//Objetos
PImage iburbuja;
PImage tornado;
PImage manzano;
PImage aceite;
PImage agua;
//Personajes
PImage[] personajes = new PImage[8];
//Fondos
PImage[] fondos = new PImage[15];

//volver a jugar
boolean vj, vj2, vj3, vj4;

//conversaciones 1 
boolean [] c ;
//reset de conversaciones 1
boolean [] p;

//conversaciones 2
boolean [] k;
//reset de conversaciones 2 con array
boolean [] r;

//conversaciones lata con array
boolean [] cl;
//reset conversaciones lata
boolean [] rl;

//conversaciones leon
boolean [] ca;
//reset conversaciones leon
boolean [] ra;

//conversaciones bruja
boolean [] cb;

//reset conversaciones bruja
boolean [] rb;


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
float [] cr;


void setup() {
  c = new boolean[9];
  p = new boolean[9];
  k =new boolean[6];
  r =new boolean[6];
  cl = new boolean[5];
  rl = new boolean[6];
  ca = new boolean[8];
  ra = new boolean[8];
  cb = new boolean[8];
  rb = new boolean[8];
  cr = new float[5];
  contador = new float[5];
  cr[0]=width;
  cr[1]=width+100;
  cr[2]=width+150;
  cr[3]=width+200;
  cr[4]=width+250;

  //sonido
  file = new SoundFile(this, "Plantasia.mp3");
  file.play();
  file.loop();

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

  flechab=loadImage("flecha.png");
  flechai=loadImage("flechai.png");
  //Imagenes fondo
  for (int i = 0; i<15; i++) {
    fondos[i]=loadImage("pantalla"+i+".png");
    fondos[i].resize(width, height);
  }

  //Imagenes objetos
  tornado = loadImage("tornado.png");
  iburbuja = loadImage("burbuja.png");
  aceite = loadImage("aceite.png");
  agua = loadImage("agua.png");
  //Imagenes personajes
  for (int i = 0; i<8; i++) {
    personajes[i]=loadImage("personaje"+i+".png");
  }

  //textos
  jugar= "Jugar";

}
void draw() {
  //------------------------------------------------------------------------------------
  //PANTALLA 1
  if (estado.equals("inicio")) {
    vj=false;
    vj2=false;
    vj3=false;
    vj4=false;
    image(fondos[0], 0, 0);

    //inicio.resize(width, height);
    textAlign(CENTER);
    textFont(titulo, 60);
    fill(255);
    text("El Mago de Oz", width/2, height/2-150);

    botones();
    fill(0);
    textFont(fjugar, 30);
    text(jugar, width/2, height/2+200);
  }

  //---------------------------------------------------
  //PANTALLA 2

  if (estado.equals("oz")) {
    image(fondos[1], 0, 0);

    if (tornx>100) {
      image(personajes[0], width/2, height/2, 100, 200);
    }
    image(personajes[2], width/2+200, height/2-10, 140, 220);
    tornx+=4;
    image(tornado, tornx, -10);

    if (tornx>300) {
      instruccion1();
    }

    if (tornx>800) {
      tornx+=0;
    }

    //Texto
    if (c[0]==true) {
      globos("Donde estoy? Esto no es Kansas. \n Este tornado si que me ha llevado lejos.", width/2+100, height/2-50, 300, 50);
      p[0]=true;
      instruccion2();
    }

    if (c[1]==true) {
      c[0]=false;      
      globos("Estas en el Reino de Oz", width/2+200, height/2-50, 200, 50);
      p[1]=true;
      instruccion2();
    }

    if (c[2]==true) {
      c[1]=false;
      globos("Reino de Oz? Qué es eso? Y quien sos vos?", width/2+100, height/2-50, 330, 50);
      p[2]=true;
      instruccion2();
    }
    if (c[3]==true) {
      c[2]=false;
      globos("Yo soy la Bruja Buena, y esas piernas que ves \n abajo de tu casa, pertenecen a la Bruja Mala.\n La mataste.", width/2+200, height/2-50, 360, 70);
      p[3]=true;
      instruccion2();
    }
    if (c[4]==true) {
      c[3]=false;
      globos("LA MATÉ?!", width/2+100, height/2-50, 150, 50);
      p[4]=true;
      instruccion2();
    }
    if (c[5]==true) {
      image(fondos[2], 0, 0);
      image(personajes[1], width/2, height/2, 100, 200);
      image(personajes[2], width/2+200, height/2-10, 140, 220);
      c[4]=false;
      globos("Sí! Y en agradecimiento, te podes quedar los zapatos \n Pero no te olvides:La bruja mala tiene una hermana, \n y ella va a hacer lo que sea para recuperarlos.", 
        width/2+200, height/2-50, 400, 60);
      p[5]=true;
      instruccion2();
    }

    if (c[6]==true) {
      image(fondos[2], 0, 0);
      image(personajes[1], width/2, height/2, 100, 200);
      image(personajes[2], width/2+200, height/2-10, 140, 220);
      c[5]=false;
      globos("NO SE LOS DES! Bueno, ahora me tengo que ir...", width/2+200, height/2-50, 350, 50);
      p[6]=true;
      instruccion2();
    }
    if (c[7]==true) {
      image(fondos[2], 0, 0);
      image(personajes[1], width/2, height/2, 100, 200);
      image(personajes[2], width/2+200, height/2-10, 140, 220);
      c[6]=false;
      globos("Irte? Nono, espera! como vuelvo yo a casa?", width/2+100, height/2-50, 340, 50);
      p[7]=true;
      instruccion2();
    }
    if (c[8]==true) {
      image(fondos[2], 0, 0);
      image(personajes[1], width/2, height/2, 100, 200);
      image(personajes[2], width/2+200, height/2-10, 140, 220);
      c[7]=false;
      globos("Eso es lo más fácil!\n Solo tenes que seguir el camino amarillo", width/2+200, height/2-50, 300, 50);
      p[8]=true;
      instruccion2();
    }

    if (burbuja==true) {
      burby-=5;
      image(fondos[2], 0, 0);
      image(personajes[1], width/2, height/2, 100, 200);
      image(iburbuja, width/2+80, burby, 200, 200);

      if (burby<0) {
        flecha=true;
        flecha(0, width-100, height/5*3.5);
      }
    }
  }


  //---------------------------------------------------PANTALLA 3-----------------------------------------------------------------------
  if (estado.equals("pantalla3")) {
    println(contador);
    contador[0]+=0.3;
    imageMode(CORNER);
    image(fondos[3], 0, 0);
    imageMode(CENTER);
    image(personajes[3], width/2, height/3, 100, 200);
    image(personajes[1], width/2, height/2+200, 100, 200);
    textSize(16);
    instruccion1();


    if (contador[0]>1 && contador[0] <50) {
      globos("Y ahora para que lado voy?", width/2+100, height/2+50, 200, 50);
    }


    if (k[0]==true) {
      instruccion2();
      globos("Hola, yo te puedo ayudar,\n me se estos caminos de memoria", width/2+150, height/4-50, 250, 50);
      r[0]=true;
    }
    if (k[1]==true) {
      instruccion2();
      k[0]=false;
      globos("¡Sí! Necesito saber como llegar al \n castillo de la bruja mala", width/2+100, height/2+50, 250, 50);
      r[1]=true;
    }

    if (k[2]==true) {
      instruccion2();
      k[1]=false;
      globos("Ah, fácil! Hacia la derecha... \n Te molestaría si te acompaño?", width/2+150, height/4-50, 250, 50);
      r[2]=true;
    }
    if (k[3]==true) {
      instruccion2();
      k[2]=false;    
      globos("Para nada! Me vendría bien la compañía \n Vamos!", width/2+100, height/2+50, 300, 50);
      r[3]=true;
      r[4]=true;

      flecha(0, width-100, height/2);
      flecha(1, width/9, height/2);
    }
    //MUERTE 1 VOLVER A JUGAR
    if (izq==true) {
      k[3]=false;
      r[4]=false;
      imageMode(CORNER);
      image(fondos[4], 0, 0, width, height);
      fill(255);
      text("GAME OVER", width/2, height/2-100);
      text("¡El espantapajaros te dijo que era para la derecha!", width/2, height/2);
      contador[0]=0;
      botones();
      fill(0);
      text("Volver a jugar", width/2, height-100);
      vj=true;
    }
  }


  //---------------------------------------------------PANTALLA 4-----------------------------------------------------------------------
  if (estado.equals("pantalla4")) {
    imageMode(CORNER);
    image(fondos[5], 0, 0);


    contador[0]=0;
    contador[1]+=0.3;
    image(personajes[3], width/3, height-300, 100, 200);
    image(personajes[1], width/3-100, height-300, 100, 200);
    if (contador[1]>1 && contador[1] <35) {
      globos("¡Manzanas! Que hambre. \n Vamos, busquemos algunas", 100, height/2-30, 200, 50);
    }
    if (contador[1]>35 && contador[1] <65) {
      globos("No sé Dorothy...mejor seguir camino", width/2-100, height/2-30, 300, 50);
    }
    if (contador[1]>65 && contador[1]<85) {
      globos("Mmm...", 100, height/2-30, 100, 50);
    }
    if (contador[1]>85) {
      fleman=true;
      fill(0);
      rectMode(CENTER);
      rect(width/3-100, height/3+70, 20, 50);
      triangle(width/3-120, height/3+70-25, width/3-80, height/3+70-25, width/3-100, height/3+70-45);
      seguir=true;

      flecha(0, width-100, height/3*2);
    }
  }

  //---------------------------------------------------PANTALLA 5 MUERTE 2 ARBOLES-----------------------------------------------------------------------
  if (estado.equals("pantalla5")) {
    image(fondos[6], 0, 0);
    fill(255);
    rect(width/2, height/2-200, width-150, 60);
    textSize(30);
    fill(0);
    text("A los arboles de Oz no les gusta ser molestados", width/2, height/2-200);
    botones();
    fill(0);
    textSize(20);
    text("Volver a jugar", width/2, height-100);
    vj2=true;
  }

  //---------------------------------------------------PANTALLA 6: HOMBRE DE LATA-----------------------------------------------------------------------
  if (estado.equals("pantalla6")) {
    image(fondos[7], 0, 0);

    image(personajes[3], width/3, height-300, 100, 200);
    image(personajes[1], width/3-100, height-300, 100, 200);
    image(personajes[5], width/3+200, height/2-50, 100, 200);
    instruccion1();

    if (agarrar==false) {
      image(aceite, width/3+150, height/2+100, 50, 70);
    }

    if (cl[0]==true) {
      globos("¿Hola?", 100, height/2, 100, 40);
      rl[0]=true;
      instruccion2();
    }

    if (cl[1]==true) {
      cl[0]=false;
      globos("Creo que no puede hablar,\n está muy oxidado.", width/2-100, height/2-50, 200, 40);
      rl[1]=true;
      instruccion2();
    }

    if (cl[2]==true) {
      cl[1]=false;
      globos("¡Ahí! Aceite. Puede ser útil.", 100, height/2, 200, 40);
      rl[2]=true;
      instruccion2();
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
      image(fondos[7], 0, 0);

      image(personajes[3], width/3, height-300, 100, 200);
      image(personajes[1], width/3-100, height-300, 100, 200);
      image(personajes[4], width/3+200, height/2-50, 100, 200);
      cl[3]=true;
    }

    if (cl[3]==true) {
      image(fondos[7], 0, 0);
      image(personajes[3], width/3, height-300, 100, 200);
      image(personajes[1], width/3-100, height-300, 100, 200);
      image(personajes[4], width/3+200, height/2-50, 100, 200);

      globos("¡Gracias! Hacia meses que no me movia. \n En agradecimiento dejenme acompañarlos ", width/3+200, height/2-100, 300, 50);
      rl[3]=true;
    }

    if (rl[3]==true) {

      flecha(0, width/4*3.4, height/5*2.9);
      flechalata=true;
    }
  }

  //---------------------------------------------------PANTALLA 7: LEÓN-----------------------------------------------------------------------

  if (estado.equals("pantalla7")) {
    image(fondos[8], 0, 0);
    image(personajes[3], width/3, height-300, 100, 200);
    image(personajes[1], width/3-100, height-300, 100, 200);
    image(personajes[4], width/3+100, height-300, 100, 200);
    imageMode(CORNER);
    image(personajes[6], width/2+50, height/2-100, 100, 170);
    instruccion1();

    if (ca[0]==true) {

      globos("Hola! ¿Qué tal?, de casualidad \n sabes cuanto falta para el \n castillo de la Bruja Mala? ", width/3-50, height/2-50, 250, 70);
      ra[0]=true;
      instruccion2();
    }

    if (ca[1]==true) {
      ca[0]=false;
      globos("El ca-castillo? \n Están yendo hacía allá?", width/2, height/2-100, 200, 50);
      ra[1]=true;
      instruccion2();
    }

    if (ca[2]==true) {
      ca[1]=false;
      globos("Sí, por? queres venir?", width/3-50, height/2-50, 200, 40);
      ra[2]=true;
      instruccion2();
    }

    if (ca[3]==true) {
      ca[2]=false;
      globos("¡NO!", width/2, height/2-100, 50, 40);
      ra[3]=true;
      instruccion2();
    }
    if (ca[4]==true) {
      ca[3]=false;
      globos("Nos vendría bien la compañía.", width/3-50, height/2-50, 250, 40);
      ra[4]=true;
      instruccion2();
    }
    if (ca[5]==true) {
      ca[4]=false;
      globos("Pe-pero...", width/2, height/2-100, 100, 40);
      ra[5]=true;
      instruccion2();
    }
    if (ca[6]==true) {
      ca[5]=false;
      globos("Por favor? Solo quiero volver a casa.", width/3-50, height/2-50, 300, 40);
      ra[6]=true;
      instruccion2();
    }
    if (ca[7]==true) {
      ca[6]=false;
      globos("...Bueno, supongo que si vamos todos \n juntos estaremos todos más seguros.", width/2, height/2-100, 300, 50);
      ra[7]=true;
      instruccion2();
    }
    if (ra[7]==true) {
      c[7]=false;
      rect(width-150, height/2, 20, 60);
      triangle(width-150-30, height/2-30, width-150+30, height/2-30, width-150, height/2-60);
      flechaleon=true;
    }
  }


  //---------------------------------------------------PANTALLA 8: CASTILLO-----------------------------------------------------------------------
  if (estado.equals("pantalla8")) {
    contador[2]+=0.01;
    image(fondos[9], 0, 0);
    image(personajes[3], width/3, height-300, 100, 200);
    image(personajes[1], width/3-100, height-300, 100, 200);
    image(personajes[4], width/3+100, height-300, 100, 200);
    image(personajes[6], width/3+180, height-280, 130, 210);

    if (contador[2]>0.2 && contador[2]<1.2) {

      globos("Bueno...Llegamos", width/3-140, height/2-50, 200, 50);
    }
    if (contador[2]>1.3 && contador[2]<2.5) {
      globos("Dorothy, ¿Estas  segura \n que queres entrar?", width/3+100, height/2-50, 200, 50);
    }
    if (contador[2]>2.6 && contador[2]<3.6) {

      globos("Sí, solo quiero \n volver a casa", width/3-140, height/2-50, 200, 50);
      flechacastillo=true;
    }
    if (flechacastillo==true) {
      fill(255);
      rect(width/2+100, height/2, 20, 60);
      triangle(width/2+100-25, height/2-30, width/2+100+25, height/2-30, width/2+100, height/2-55);
    }
  }


  //---------------------------------------------------PANTALLA 7:BRUJA-----------------------------------------------------------------------

  if (estado.equals("pantalla9")) {
    image(fondos[10], 0, 0);
    image(personajes[7], width/3-100, height-300, 130, 250);
    image(personajes[3], width/2+100, height-290, 100, 200);
    image(personajes[1], width/2, height-290, 100, 200);
    image(personajes[4], width/2+180, height-290, 100, 200);
    image(personajes[6], width/2+260, height-280, 130, 210);
    image(agua, width/2-30, height/2+150, 50, 90);
    instruccion1();

    if (cb[0]==true) {
      globos("¡Ah bueno! ¡Mira quien apareció! \n La Asesina de Brujas", width/3-100, height/2-50, 250, 60);
      rb[0]=true;
    }
    if (cb[1]==true) {
      cb[0]=false;   
      globos("¡Fue un accidente!", width/2, height/2-50, 150, 50);
      rb[1]=true;
    }

    if (cb[2]==true) {
      cb[0]=false; 
      cb[1]=false;
      globos("¿Accidente? ¡JA! \n encima tenes la cara de \n usar sus zapatos. DAMELOS.", width/3-100, height/2-50, 250, 60);
      rb[2]=true;
    }

    if (cb[3]==true) {
      cb[2]=false;
 
      globos("No, ¡no puedo!",width/2, height/2-50, 150, 50);
      rb[3]=true;
    }

    if (cb[4]==true) {
      cb[3]=false;
      globos("Mirá mocosa, hagamos un trato, \n vos me das los zapatos y \n yo misma me aseguraré \n que vuelvas a casa.",width/3-100, height/2-100, 250, 100);
      rb[4]=true;
    }
    if (cb[5]==true) {
      contador[3]+=0.01;
      cb[4]=false;

      if (contador[3]>0 && contador[3]<0.7) {        
         globos("No sé...",width/2, height/2-50, 150, 50);
      }
      opcion=true;

      if (opcion==true) {
        image(fondos[10], 0, 0);
        image(personajes[7], width/3-100, height-300, 130, 250);
        image(personajes[3], width/2+100, height-290, 100, 200);
        image(personajes[1], width/2, height-290, 100, 200);
        image(personajes[4], width/2+180, height-290, 100, 200);
        image(personajes[6], width/2+260, height-280, 130, 210);
        image(agua, width/2-30, height/2+150, 50, 90);
        fill(255);
        rect(width/2+50, height-50, 150, 50);
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

  //---------------------------------------------------PANTALLA 10:final 1-----------------------------------------------------------------------
  if (estado.equals("pantalla10")) {
    image(fondos[11], 0, 0);
    fill(255);
    textFont(titulo, 60);
    text("GAME OVER", width/2-200, 50);
    textFont(fjugar, 30);
    textSize(20);
    text("Nunca confies en una bruja", width/2-200, height/2+150);

    botones();
    fill(0);
    text("Créditos",width/2, height/2+200);
  }

  //---------------------------------------------------PANTALLA 11:derretida-----------------------------------------------------------------------
  if (estado.equals("pantalla11")) {
    contador[0]+=0.01;
    if (contador[0]>0 && contador[0]<2.5) {
      image(fondos[12], width/2, 0, width/2, height);
      image(fondos[13], 0, 0, width/3*2, height);
      textSize(30);
      fill(255);
      rect(width/2, 70, width-150, 60);
      fill(0);
      text("¡Qué casualidad! El agua es letal para las brujas.", width/2, 70);
    }

    if (contador[0]>2.5) {
      image(fondos[14], 0, 0, width, height);
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
    }
  }

  //---------------------------------------------------PANTALLA 13: CRÉDITOS-----------------------------------------------------------------------

  if (estado.equals("creditos")) {
    cr[0]-=1;
    cr[1]-=1;
    cr[2]-=1;
    cr[3]-=1;
    cr[4]-=1;

    background(0);
    fill(255);
    textFont(titulo, 60);

    text("El Mago de Oz", width/2, cr[0]);
    textFont(fjugar, 30);
    text("Isabella Pinto", width/2, cr[1]);
    text("Tecnología Multimedial", width/2, cr[2]);
    text("2020", width/2, cr[3]);

    if (cr[3]<0) {
      botones();
      fill(0);
      textSize(16);
      text("Volver a jugar",width/2, height/2+200);
      vj3=true;
    }
  }

  //_________________________________________________________MOUSE PRESSED________________________________________________________________________________________________//
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
      c[0]=true;
    }

    //Skipear conversación
    for (int i=0; i<8; i++) {
      if (p[i]==true && mouseX>0 && mouseX<width && mouseY>0 && mouseY<height) {
        c[i+1]=true;
      }
    }

    if (p[8]==true && mouseX>0 && mouseX<width && mouseY>0 && mouseY<height) {
      burbuja=true;
    }


    //FLECHA
    if (flecha==true && mouseX>width-130 && mouseX<width-40 && mouseY>height/5*3.4 && mouseY<height/5*4) {
      estado="pantalla3";
    }
  }

  //-------------------------------------------------------------------PANTALLA 3

  //INTERACTUAR CON ESPANTAPAJAROS
  if (estado.equals("pantalla3")) {

    if (mouseX>width/2-50 && mouseX<width/2+50 && mouseY>height/3-100 && mouseY<height/3+100) {
      k[0]=true;
    }

    //Skipear conversación.
    for (int i=0; i<3; i++) {
      if (r[i]==true && mouseX>0 && mouseX<width && mouseY>0 && mouseY<height) {
        k[i+1]=true;
      }
    }

    //IZQUIERDA
    //flecha derecha
    if (r[3]==true) {
      if (mouseX>100-60 && mouseX<100+35 && mouseY>height/2-30 && mouseY<height/2+30) {
        izq=true;
      }
    }
    //DERECHA      
    if (r[4]==true) {
      if (mouseX>width-100-35 && mouseX<width-100+60 && mouseY>height/2-30 && mouseY<height/2+30) {
        estado="pantalla4";
      }
    } 

    //VOLVER A JUGAR
    if (vj==true) {
      if (mouseX>width/2-75 && mouseX<width/2+75 && mouseY>height-100-25 && mouseY<height-100+25) {
        restart();
      }
    }
  }

  //--------------------------------------Pantalla 4
  if (estado.equals("pantalla4")) {

    if (fleman==true &&  mouseX>width/3-120 && mouseX<width/3-80 && mouseY>height/3+70-45 && mouseY<height/3+70+25) {
      estado="pantalla5";
    }

    if (seguir==true && mouseX>width-100-35 && mouseX<width-100+60 && mouseY>height/4*2.46 && mouseY<height/3*2.15) {
      estado="pantalla6";
    }
  }

  //---------------------------------------Pantalla 5
  if (estado.equals("pantalla5")) {
    if (vj2==true && mouseX>width/2-75 && mouseX<width/2+75 && mouseY>height-100-25 && mouseY<height-100+25) {
      restart();
    }
  }


  //----------------------------------------------------PANTALLA 6
  if (estado.equals("pantalla6")) {
    if (mouseX>width/3+200 && mouseX<width/3+300 && mouseY>height/2-50 && mouseY<height/2-50+200) {
      cl[0]=true;
    }
    if (rl[0]==true && mouseX>0 && mouseX<width && mouseY>0 && mouseY<height) {
      cl[1]=true;
    }
    if (rl[1]==true && mouseX>0 && mouseX<width && mouseY>0 && mouseY<height) {
      cl[2]=true;
    }
    if (rl[2]==true && mouseX>width/3+150 && mouseX<width/3+200 && mouseY>height/2+100 && mouseY<height/2+170) {
      agarrar=true;
    }

    if (agarrar==true && mouseX>width/3+200 && mouseX<width/3+300 && mouseY>height/2-50 && mouseY<height/2-50+200) {
      desoxidado=true;
    }

    if (flechalata==true && mouseX>width-100 && mouseX<width-40 && mouseY>height/4*2.2 && mouseY<height/5*3.2) {
      estado="pantalla7";
    }
  }

  //----------------------------------------------------PANTALLA 7
  if (estado.equals("pantalla7")) {
    if (mouseX>width/2+50 && mouseX<width/2+50+100 && mouseY>height/2-100 && mouseY<height/2-100+170) {
      ca[0]=true;
    }
    
    //Skipear conversación.
    for (int i=0; i<7; i++) {
      if (ra[i]==true && mouseX>0 && mouseX<width && mouseY>0 && mouseY<height) {
        ca[i+1]=true;
      }
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
      cb[0]=true;
    }
     for (int i=0; i<5; i++) {
      if (rb[i]==true && mouseX>0 && mouseX<width && mouseY>0 && mouseY<height) {
        cb[i+1]=true;
      }
    }


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
    if (mouseX>width/2-75 && mouseX<width/2+75 && mouseY>height-100-25 && mouseY<height-100+25) {
      estado="creditos";
    }
  }

  //------créditos
  if (estado.equals("creditos")) {
    if (vj3==true) {
      restart();
    }
    if (vj4==true) {
      restart();
    }
  }
}
