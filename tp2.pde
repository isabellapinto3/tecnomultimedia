PImage logo;
float h,f1,r,g,h2,h3,h4,h5,h6,h7;
PFont ac;
PFont t,t2;

void setup(){
  size(600,400);
  logo=loadImage("logo.png");
  imageMode(CENTER);
  h=600;
  h2=1000;
  h3=1300;
  h4=1600;
  h5=1900;
  h6=2100;
  h7=2400;
  textAlign(CENTER);
  f1=255;
  r=255;
  g=255;
  ac=loadFont("BenguiatITCbyBT-Bold-48.vlw");
  t=loadFont("BusoramaITCbyBT-Bold-48.vlw");
  t2=loadFont("BusoramaITCbyBT-Bold-36.vlw");
}
void draw(){
  background(0);
  //f1-=3;
  //fill(f1);
  r-=2;
  g-=2;
  fill(r,g,0);
  textSize(20);
  textFont(t2);
  text("a film by",width/2,height/2);
  textFont(t);
  text("quentin tarantino", width/2,(height/2)+40);
  h-=0.8;
  h2-=0.8;
  h3-=0.8;
  h4-=0.8;
  h5-=0.8;
  h6-=0.8;
  h7-=0.8;
  image(logo,width/2,h);
  fill(255);
  textFont(ac);
  text("John Travolta", width/2, h2);
  text("Samuel L Jackson", width/2, h3);
  text("Uma Thurman", width/2, h4);
  text("Harvey Keitel", width/2, h5);
  text("Tim Roth", width/2, h6);
  text("Amanda Plummer", width/2, h7);
}
