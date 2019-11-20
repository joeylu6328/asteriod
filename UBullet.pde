class UBullet extends GameObject{
  PImage ubullet = loadImage("UBullet.png");
  
  UBullet(float x, float y){
    location = new PVector(x,y);
    velocity = new PVector(myShip.location.x-x,myShip.location.y-y);
    velocity.setMag(4);
    size = 20;
    lives = 1;
  }
  void show(){
    ubullet.resize(size, size);
    image(ubullet, location.x, location.y);
    //fill(255,0,0);
    //ellipse(location.x,location.y,size,size);
    
    
  }
  void act(){
    location.add(velocity);
    if(location.y < -50 || location.y > height+50 ||location.x < -50||location.x > width+50){
      lives=0;
    }
    
  }
  
  
  
}
