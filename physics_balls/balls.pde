class Ball {
  float mass, size;
  color background;
  PVector momentum, pos;  
  Ball(float posx, float posy, float vx, float vy, float m, color c, float s){
    background = c;
    momentum = new PVector(vx, vy);
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
      momentum.x = -momentum.x;
    }
    if((pos.y-(size/2) <= 0) || (pos.y+(size/2) >= height)){
      momentum.y = -momentum.y;
    }
    pos.x += momentum.x/mass;
    pos.y += momentum.y/mass;
  }
  
}