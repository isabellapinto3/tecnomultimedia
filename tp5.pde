// tp5 | tmm1 | FdA | UNLP
// com2 | Prof. Matias Jauregui Lorda

// Isabella Pinto
// Minijuego "Ding Dong, the evil witch is dead."

/* PROPUESTA 
  
 El juego estaría en la pantalla 11 de mi Aventura Grafica, cuando el jugador decide tirarle agua a la bruja
 en vez de darle los zapatos. 
 Al hacer esto, entramos en el minijuego, el cual consiste de la bruja, que con la habilidad de teletransportarse intenta evitar que
 dorothy(el jugador) la mate con su pistola de agua.
 El jugador(Dorothy) debe matarla con su cursor, el cual será reemplazado con una mira. La bruja tendrá una barra de vida arriba de la
 pantalla, y con cada disparo acertado por el jugador, se irá reduciendo. Habrá también un contador, y si el tiempo se acaba y la bruja 
 sigue viva se pierde. Se gana si se mata a la bruja dentro del tiempo acordado. 
 
 */

Juego juego;

void setup() {
  size( 800, 600 );
  juego = new Juego();
  imageMode(CENTER);
  
   
}

void draw() {
  background(0);  
  juego.actualizar();
  juego.dibujar();
  
}
void mousePressed() {
  juego.mouse();
 
}
