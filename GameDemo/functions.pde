////////////////////////////FUNCTIONS////////////////////////////
void displayBG(){
  imageMode(CENTER);
  for (int i = 0; i < 2; i ++){
    Background back = bg.get(i); 
    back.display();
    back.move();
    if (back.xpos <= -width / 2){
      PImage img = back.reimg();
      bg.remove(i);
      bg.add(new Background(img, width * 3 / 2));
    }
  }
}
void displayMove(int counter) {
  for (Obstacles ob : obs){
    ob.display();
    ob.move();
  }
  for (Subsidy sub : subs){
    sub.display();
    sub.move();
  }
  ball1.display(whales[counter]);
}

void generate() {
  for (int i = 0; i < subs.size(); i ++) {
    Obstacles ob = obs.get(i);
    Subsidy sub = subs.get(i);
    if (ob.xpos < 0) {
      obs.remove(i);
      obs.add(new Obstacles(width + random(40), random(300, height), random(5, 10)));
    }
    if (sub.xpos < 0) {
      subs.remove(i);
      subs.add(new Subsidy(width + random(40), random(300, height), random(5, 10)));
    }
  }
}

void control() {
  if (keyPressed) {
    if (key == 'w' && ball1.ypos > 250) {
      ball1.moveUp();
    }
    if (key == 'a' && ball1.xpos > 0) {
      ball1.moveLeft();
    }
    if (key == 's' && ball1.ypos < height - 5) {
      ball1.moveDown();
    }
    if (key == 'd' && ball1.xpos < width - 5) {
      ball1.moveRight();
    }
  }
}

int collision(int count) {
  for (int i = 0; i < subs.size(); i++) {
    Obstacles ob = obs.get(i);
    Subsidy sub = subs.get(i);
    float ob1 = dist(ob.xpos + 26, ob.ypos, ball1.xpos, ball1.ypos);
    float ob2 = dist(ob.xpos - 26, ob.ypos, ball1.xpos, ball1.ypos);
    if (ob1 + ob2 <= 60 + ob.r) {
      ball1.hpDownC();
      obs.remove(i);
      obs.add(new Obstacles(width + random(40), random(300, height), random(4, 6)));
      count = 0;
    }
    if (dist(ball1.xpos, ball1.ypos, sub.xpos, sub.ypos) <= 30) {
      ball1.hpUpC();
      subs.remove(i);
      subs.add(new Subsidy(width + random(40), random(300, height), random(4, 6)));
    }
    gameState = ball1.liveOrDie(gameState);
  }
  return count;
}

float moreBlocks(float present, float previous){
  if (present - previous > 10000){
    for (int i = 0; i < 2; i ++){
      obs.add(new Obstacles(width + random(40), random(300, height), random(4, 6)));
      subs.add(new Subsidy(width + random(40), random(300, height), random(4, 6)));
    }
    println(subs.size());
    previous = present;
  }
  return previous;
}

float[] breathe(float present, float[] brePara, int seaLevel){
  float count = brePara[1];
  float previous = brePara[0];
  int[] intervals = {20000, 15000, 12000, 10000, 8000, 5000, 3000, 2000, 1000, 1000};
  if (ball1.ypos > seaLevel + 20 && present - previous >= intervals[int(count)]){
    ball1.breatheDownB();
    brePara[0] = present;
    brePara[1] ++;
  } else if (ball1.ypos <= seaLevel + 20 && present - previous >= 2000){
    ball1.breatheUpB();
    brePara[1] = 0;
    brePara[0] = present;
  }
  return brePara;
}

float[] hunger(float present, float[] Para){
  float count = Para[1];
  float previous = Para[0];
  int[] intervals = {10000, 8000, 4000, 3000};
  if (present - previous >= intervals[int(count)]){
    ball1.hpDownC();
    println("here");
  }
  Para[0] = present;
  Para[1] = count;
  return Para;
}
