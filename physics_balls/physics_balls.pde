Ball[] main = new Ball[4];

void setup(){
  //size(1500, 900);
  fullScreen();
  randomSeed(123);
  noStroke();
  for(int i = 0; i < main.length; i ++){
    float diam = random(150) + 50;
    main[i] = new Ball(random(width-diam)+diam/2, random(height-diam)+diam/2, random(60)-30, random(60)-30, diam, color(random(255), random(255), random(255)), diam);
  }
}

void draw(){
  //println(frameRate);
  background(122.5);
  for(int i = 0; i < main.length; i ++){
    main[i].move();
    main[i].display();    
  }
  
  for(int i = 0; i < main.length-1; i ++){
    for(int j = i+1; j < main.length; j ++){
      if(sqrt(sq(main[i].pos.x-main[j].pos.x) + sq(main[i].pos.y - main[j].pos.y)) <= (main[i].size + main[j].size)/2){
        println("There was a collison between ", i, " and ", j);
        exchange(main[i], main[j]);
        //noLoop();
      }
    }
  }
  
}

void exchange(Ball i, Ball j){
  float angle1 = atan((-i.pos.y + j.pos.y)/(i.pos.x - j.pos.x));
  println(angle1 * (360/(2*PI)));
}