class Asteroid extends GameObject{
  
  PImage asteroid = loadImage("aster.png");
  PImage explosion = loadImage("explosion.png");
  
  Asteroid(){
    lives = 1;
    size = 200;
    location = new PVector(random(width), random(height));
    velocity = new PVector(0,1);
    velocity.setMag( random(1,3));
    velocity.rotate( random(TWO_PI));
  }
  Asteroid(int s, float x, float y){
    lives = 1;
    size = s;
    location = new PVector(x, y);
    velocity = new PVector(0,1);
    velocity.setMag( random(1,3));
    velocity.rotate( random(TWO_PI));   
  }
  
  void show(){    
    asteroid.resize(size, size);
    image(asteroid, location.x, location.y);
    //fill(255);
    //ellipse(location.x,location.y,size,size);
  }
  void act(){
    super.act();
    int i = 0;
    while( i < myGameObjects.size()){
      GameObject myObj = myGameObjects.get(i);
      if(myObj instanceof Bullet){
        if(dist(myObj.location.x,myObj.location.y,location.x,location.y) <= size/2+myObj.size/2){
          explosion.resize(size/2, size/2);
          image(explosion, location.x, location.y);   
          score++;
          lives = 0;
          myObj.lives = 0;
          myGameObjects.add(new Asteroid(size/2,location.x,location.y));
          myGameObjects.add(new Asteroid(size/2,location.x,location.y));
          for (int j =0; j< 30; j++){
            myGameObjects.add(new Explosion(size/4,location.x,location.y));
          }
        }
        
        
      }
      i++;
    }
    if(size < 25){
      lives = 0;
    }
  }
}
