final int intro = 0;
final int game = 1;
final int gameover = 2;
int mode;
PFont font;
boolean up,down,left,right,space;
PImage shipimg;
PImage explosion;
PImage background;
Ship myShip;
ArrayList<GameObject> myGameObjects;

void setup(){
  size(800,600,FX2D);
  textAlign(CENTER, CENTER);
  font = createFont("Comic Sans MS", 30);
  mode = 0;
  background = loadImage("Background.jpg");
  background.resize(width,height);
  explosion = loadImage("explosion.png");
  shipimg = loadImage("spaceship.png");
  shipimg.resize(50,50);
  imageMode(CENTER);
  myShip = new Ship();
  myGameObjects = new ArrayList<GameObject>();  
  myGameObjects.add(new Asteroid());
  myGameObjects.add(new Asteroid());
  myGameObjects.add(new Asteroid());
  
}

void draw(){
  if (mode==intro) {
    introDraw();
  } else if (mode==game) {
    gameDraw();
  } else if (mode==gameover) {
    gameoverDraw();
  } else {
    println("Mode error");
  }
  
  
}
void keyPressed(){
  if (mode==intro) {
    introPress();
  } else if (mode==game) {
    gamePress();
  } else if (mode==gameover) {
    gameoverPress();
  } else {
    println("Mode error");
  }
}



void keyReleased(){
  if (mode==intro) {
    introRelease();
  } else if (mode==game) {
    gameRelease();
  } else if (mode==gameover) {
    gameoverRelease();
  } else {
    println("Mode error");
  }
  
}
