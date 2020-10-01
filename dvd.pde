
int cant = 50;
Logo[] logos = new Logo[cant];

void setup() {
  size(800, 600);
  //d= new Logo();
  
  for (int i=0; i<logos.length; i++) {
    logos[i]= new Logo(int(random(0, 255)), int(random(0, 255)), int(random(0, 255)));
    println(logos[i]);
  }
}

void draw() {  
  
  background(0);
  for (int i=0; i<logos.length; i++) {
    
    logos[i].mover(int(random(0, 255)), int(random(0, 255)), int(random(0, 255)));
    logos[i].dibujar();
  }
  
}
