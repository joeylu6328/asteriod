class Ship extends GameObject{
  //1.Instance Variables
  PVector direction;
  int shotTimer;
  int threshold;
  
  //2.Constructor
  Ship() {
    lives = 3;
    shotTimer = 0;
    threshold = 30;
    location = new PVector(width/2, height/2);
    velocity = new PVector(0, 0); 
    direction = new PVector(0, -0.05);
  }  
  //3.Behaviour functions
  void show() {
    pushMatrix();
    translate(location.x, location.y);
    rotate(direction.heading()+PI/2);
    image(shipimg, 0, 0);    
    popMatrix();
    
    
  }
  void act() {
    super.act();
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
    
    
  }
}
