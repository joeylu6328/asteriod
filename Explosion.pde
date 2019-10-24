class Explosion extends GameObject{
  int timer;
  float x,y,vx,vy;
 
  
  Explosion(int s, float x, float y){
    timer = 30;
    lives = 1;
    size = int( random(1,s));
    //this.x=x;
    //this.y=y;
    //vx = random(-5,5);
    //vy = random(-5,5);
    location = new PVector(x, y);
    velocity = new PVector(0,1);
    velocity.setMag( random(1,3));
    velocity.rotate( random(TWO_PI));   
  }
  
  void show(){   
    //fill(255);
    //noStroke();
    //ellipse(location.x,location.y,size,size);
    image(explosion, location.x, location.y,size,size);
   
  }
  void act(){
    location.add(velocity);
    //x+=vx;
    //y+=vy;
    timer--;
    if (timer<0) {
      lives = 0;
    }
  }
}
