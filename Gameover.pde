void gameoverDraw() {
  fill(0, 0, 0, 5);
  noStroke();
  rect(0, bg, 800, 600);
  if (bg<0) {
    bg+=12;
  }
  fill(250, 0, 0);
  textSize(100);
  text("GAMEOVER", 400, bg+300);
  if (bg>=0) {
    fill(255);
    textSize(30);
    text("Score: "+score, 400, 480);
    text("Lives remain: "+myShip.lives, 400, 520);
  }
}

void gameoverMouse(){
}
void gameoverPress() {
}


void gameoverRelease() {

  if (myShip.lives > 0 && key == ENTER) {
    mode=1;
    invincible = 180;
    myShip.location.x=width/2;
    myShip.location.y=height/2;
    myShip.velocity.setMag(0);
    bg=-600;
  } else if (myShip.lives <= 0 && key == ENTER) {
    setup();
    mode = 0;
  }
  if(keyCode == UP) up = false;
  if(keyCode == DOWN) down = false;
  if(keyCode == LEFT) left = false;
  if(keyCode == RIGHT) right = false;
  if(key == ' ') space = false;
}
