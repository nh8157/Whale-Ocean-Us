////////////////////////////FUNCTIONS////////////////////////////
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
      obs.add(new Obstacles(width + random(40), random(100, height), random(5, 10)));
    }
    if (sub.xpos < 0) {
      subs.remove(i);
      subs.add(new Subsidy(width + random(40), random(100, height), random(5, 10)));
    }
  }
}

void control() {
  if (keyPressed) {
    if (key == 'w' && ball1.ypos > 105) {
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

void collision() {
<<<<<<< HEAD
  for (int i = 0; i < subs.size(); i++) {
    Obstacles ob = obs.get(i);
    Subsidy sub = subs.get(i);
    if (dist(ball1.xpos, ball1.ypos, ob.xpos, sub.ypos) <= 20 ) {
      ball1.hpDownC();
      obs.remove(i);
      obs.add(new Obstacles(width + random(40), random(100, height), random(4, 6)));
    }
    if (dist(ball1.xpos, ball1.ypos, sub.xpos, sub.ypos) <= 10) {
      ball1.hpUpC();
      subs.remove(i);
      subs.add(new Subsidy(width + random(40), random(100, height), random(4, 6)));
    }
    gameState = ball1.liveOrDie(gameState);
  }
}

float moreBlocks(float present, float previous){
  if (present - previous > 10000){
    for (int i = 0; i < 2; i ++){
      obs.add(new Obstacles(width + random(40), random(100, height), random(4, 6)));
      subs.add(new Subsidy(width + random(40), random(100, height), random(4, 6)));
    }
    println(subs.size());
    previous = present;
  }
  return previous;
}

//void breathe(){
//  float present = millis();
//  if (ball1.ypos > 100 && present - previous >= interval){
//    ball1.hpDownB();
//  } else if (ball1.ypos == 100){
//    ball1.hpUpB();
//    previous = present;
//  }
//  println(present - previous);
//}
