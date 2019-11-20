final int intro = 0;
final int game = 1;
final int gameover = 2;
int mode;
int score;
int bg;
PFont font;
boolean up,down,left,right,space;

PImage explosion;
PImage background;

int invincible;
Ship myShip;
ArrayList<GameObject> myGameObjects;

void setup(){
  size(800,600,FX2D);
  textAlign(CENTER, CENTER);
  font = createFont("Comic Sans MS", 30);
  mode = 0;
  score = 0;
  bg=-600;
  background = loadImage("Background.jpg");
  background.resize(width,height);
  explosion = loadImage("explosion1.png");
 
  imageMode(CENTER);
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
void mouseReleased(){
  if (mode==intro) {
    introMouse();
  } else if (mode==game) {
    gameMouse();
  } else if (mode==gameover) {
    gameoverMouse();
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
