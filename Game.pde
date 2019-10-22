void gameDraw(){
  background(0);
  myShip.show(); 
  myShip.act();
  int i = 0;
  while( i < myGameObjects.size()){
    GameObject myObj = myGameObjects.get(i);
    myObj.show();
    myObj.act();
    if(myObj.lives == 0){
      myGameObjects.remove(i);
    }
    else{
      i++;
    }
  }
  
  
}
void gamePress(){
  if(keyCode == UP) up = true;
  if(keyCode == DOWN) down = true;
  if(keyCode == LEFT) left = true;
  if(keyCode == RIGHT) right = true;
  if(key == ' ') space = true;
}



void gameRelease(){
  if(keyCode == UP) up = false;
  if(keyCode == DOWN) down = false;
  if(keyCode == LEFT) left = false;
  if(keyCode == RIGHT) right = false;
  if(key == ' ') space = false;
  
  
}
