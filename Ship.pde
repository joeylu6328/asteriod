class Ship extends GameObject{
  //1.Instance Variables
  PImage shipimg;
  PImage shipimginv;
  PVector direction;
  int shotTimer;
  int threshold;
  int speed;
  PImage ship1 = loadImage("spaceship1.png");
  PImage ship1inv = loadImage("spaceship1inv.png");
  PImage ship2 = loadImage("spaceship2.png");
  PImage ship2inv = loadImage("spaceship2inv.png");
  PImage ship3 = loadImage("spaceship3.png");
  PImage ship3inv = loadImage("spaceship3inv.png");
  //https://opengameart.org/content/2d-spaceship-10
  //2.Constructor
  Ship(int img) {
    location = new PVector(width/2, height/2);
    if(img == 1){
      invincible = 180;
      lives = 3;
      size = 50;
      shipimg = ship1;
      shipimginv = ship1inv;
      shipimg.resize(size,size);
      shipimginv.resize(size,size);
      shotTimer = 0;
      threshold = 15;      
      velocity = new PVector(0, 0); 
      direction = new PVector(0, -0.1);      
    }
  }  
  //3.Behaviour functions
  void show() {
    pushMatrix();
    translate(location.x, location.y);
    rotate(direction.heading()+PI/2);
    if(invincible < 0){
      image(shipimg, 0, 0);    
    }
    else{
      image(shipimginv,0,0);
    }
    popMatrix();    
  }
  
  void act() {
    location.add(velocity);
    super.act();
    if( invincible >= 0){
      invincible--;
    }
    shotTimer++;
    if (up) velocity.add(direction);
    if (down) velocity.sub(direction);
    if (left) direction.rotate(-radians(4));
    if (right) direction.rotate(radians(4));
    if (space && shotTimer>=threshold) {
      myGameObjects.add(new Bullet());
      shotTimer=0;
    }
    int i=0;
    while( i < myGameObjects.size()){
      GameObject myObj = myGameObjects.get(i);
      if((myObj instanceof Asteroid || myObj instanceof UBullet) && invincible < 0){
        if(dist(myObj.location.x,myObj.location.y,location.x,location.y) <= size/2+myObj.size/2){
          lives--;
          myObj.lives=0;
          mode = 2;
        }
        
        
      }
      i++;
    }
    
  }
}
