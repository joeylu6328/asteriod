void introDraw(){

  image(background,400,300); 
  fill(255);
  textFont(font);
  textSize(100);
  text("Asteroid", 400, 300);
}
void introPress(){
}
void introRelease(){
  mode=game;
}
