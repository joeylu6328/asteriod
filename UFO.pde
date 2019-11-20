class UFO extends GameObject{
  
  PImage UFO = loadImage("UFO.png");
  PImage UFO2 = loadImage("UFO2.png");
  int shotTimer;
  int threshold;
  int timer;
  
  UFO() {
    lives = 2;
    size = 50;
    shotTimer = 0;
    threshold = 180;
    timer = 0;
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
    if(timer <= 0){
      image(UFO, 0, 0, size, size);    
    }
    else{
      image(UFO2, 0, 0, size, size);    
    }
    
    popMatrix();
    
    
  }
  void act() {
    super.act();
    shotTimer++;
    if(timer > 0){
      timer--;
    }
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
          score += 3;
          myObj.lives = 0;
          lives --;
          if(lives > 0){
            timer = 5;
          }
          else{
            for (int j =0; j< 30; j++){
              myGameObjects.add(new Explosion(size/4,location.x,location.y));
            }
          }
        }
        
        
      }
      i++;
    }
    
  }
}
