class UFO extends GameObject{
  
  PImage UFO = loadImage("UFO.png");
  int shotTimer;
  int threshold;
  
  UFO() {
    lives = 1;
    size = 50;
    shotTimer = 0;
    threshold = 180;
    location = new PVector(random(10,width), random(10,height));      
    while((location.x > width/4 && location.x < width*3/4)&&(location.y > height/4 && location.y < height*3/4)){
      location = new PVector(random(10,width), random(10,height));      
    }
    if(location.x <= width/4 || location.x >= width*3/4){
      velocity = new PVector(0, 1); 
    }
    else{
      velocity = new PVector(1, 0); 
    }
  }  
  void show() {
    pushMatrix();
    translate(location.x, location.y);
    image(UFO, 0, 0, size, size);    
    popMatrix();
    
    
  }
  void act() {
    super.act();
    shotTimer++;
    if(shotTimer < threshold/2){
      location.add(velocity);
    }
    if (shotTimer >= threshold) {
      myGameObjects.add(new UBullet(location.x,location.y));
      shotTimer=0;
    }
          
    int i=0;
    while( i < myGameObjects.size()){
      GameObject myObj = myGameObjects.get(i);
      if(myObj instanceof Bullet){
        if(dist(myObj.location.x,myObj.location.y,location.x,location.y) <= size/2+myObj.size/2){
          score+=2;
          lives = 0;
          myObj.lives = 0;
          for (int j =0; j< 30; j++){
            myGameObjects.add(new Explosion(size/4,location.x,location.y));
          }
        }
        
        
      }
      i++;
    }
    
  }
}
