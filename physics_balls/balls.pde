class Ball {
  float mass, size;
  color background;
  PVector velocity, pos;  
  Ball(float posx, float posy, float vx, float vy, float m, color c, float s){
    background = c;
    velocity = new PVector(vx, vy);
    mass = m;
    size = s;
    pos = new PVector(posx, posy);
  }
  
  void display(){
    fill(background);
    ellipse(pos.x, pos.y, size, size);
  }
  
  void move(){
    if((pos.x-(size/2) <= 0) || (pos.x+(size/2) >= width)){
      velocity.x = -velocity.x;
    }
    if((pos.y-(size/2) <= 0) || (pos.y+(size/2) >= height)){
      velocity.y = -velocity.y;
    }
    pos.x += velocity.x;
    pos.y += velocity.y;
  }
  
}