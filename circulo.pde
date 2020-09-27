Objeto circ;

void setup(){
  size(600,600);
  circ=new Objeto(width/2,width/2);
  //circ.x=width/2;
  //circ.y=width/2;
  //circ.s=width/4;
}

void draw(){
  fill(#F0223A,50);
  rect(0,0,width,height);
  circ.dibujo();
}

void mouseMoved(){
  circ.moverConMouse();
}
