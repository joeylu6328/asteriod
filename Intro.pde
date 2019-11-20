void introDraw(){

  image(background,400,300); 
  fill(200);
  textFont(font);
  textSize(80);
  text("Asteroid", 400, 100);
  PImage img1 = loadImage("spaceship1.png");
  image(img1, 200, 350, 150, 150); 
  PImage img2 = loadImage("spaceship2.png");
  image(img2, 400, 350, 150, 200); 
  PImage img3 = loadImage("spaceship3.png");
  image(img3, 600, 350, 200, 150); 
}


void introMouse(){
  
  
  myShip = new Ship(1);
  
  mode++;
}
void introPress(){
}
void introRelease(){
}
