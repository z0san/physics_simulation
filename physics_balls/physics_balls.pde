Ball[] main = new Ball[2];

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

  PVector portion = new PVector ();
  portion.x = cos(angle1);
  portion.y = sin(angle1);
  println(portion.x, portion.y);
  
  PVector change1 = new PVector(j.velocity.x * j.mass * -1 * portion.x, j.velocity.y * j.mass * -1 * portion.y);
  change1.x = change1.x/i.mass;
  change1.y = change1.y/i.mass;
  
  PVector change2 = new PVector(i.velocity.x * i.mass * portion.x, i.velocity.y * i.mass * portion.y);
  change2.x = change2.x/j.mass;
  change2.y = change2.x/j.mass;
  
  i.velocity.x += change1.x;
  i.velocity.y += change1.y;
  
  j.velocity.x += change2.x;
  j.velocity.y += change2.y;
}