class UFO extends GameObject{
  PVector direction;
  int shotTimer;
  int threshold;

  
  UFO() {
    lives = 1;
    shotTimer = 0;
    threshold = 30;
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 0); 
    direction = new PVector(0, -0.1);
  }  
  void show() {
    pushMatrix();
    translate(location.x, location.y);
    rotate(direction.heading()+PI/2);
    image(shipimg, 0, 0);    
    popMatrix();
    
    
  }
  void act() {
    super.act();
    if( invincible >= 0){
      invincible--;
    }
    shotTimer++;
    location.add(velocity);
    if (up) velocity.add(direction);
    if (down) velocity.sub(direction);
    if (left) direction.rotate(-radians(2));
    if (right) direction.rotate(radians(2));
    if (space && shotTimer>=threshold) {
      myGameObjects.add(new Bullet());
      shotTimer=0;
    }
    int i=0;
    while( i < myGameObjects.size()){
      GameObject myObj = myGameObjects.get(i);
      if(myObj instanceof Asteroid && invincible < 0){
        if(dist(myObj.location.x,myObj.location.y,location.x,location.y) <= size/2+myObj.size/2){
          lives--;
          mode++;
        }
        
        
      }
      i++;
    }
    
  }
}
