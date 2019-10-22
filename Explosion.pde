class Explosion extends GameObject{
  int shotTimer;
  int threshold;
 
  
  Explosion(int s, float x, float y){
    shotTimer = 0;
    threshold = 30;
    lives = 1;
    size = int( random(20,s));
    location = new PVector(x, y);
    velocity = new PVector(0,1);
    velocity.setMag( random(1,3));
    velocity.rotate( random(TWO_PI));   
  }
  
  void show(){    
    explosion.resize(size, size);
    image(explosion, location.x, location.y);
   
  }
  void act(){
    location.add(velocity);
    shotTimer++;
    if (shotTimer>=threshold) {
      lives = 0;
    }
  }
}
