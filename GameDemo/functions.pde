////////////////////////////FUNCTIONS////////////////////////////
void displayMove(int counter) {
  for (int i = 0; i < subs.length; i ++) {
    obs[i].display();
    subs[i].display();
    obs[i].move();
    subs[i].move();
  }
  ball1.display(whales[counter]);
}

void generate() {
  for (int i = 0; i < subs.length; i ++) {
    if (obs[i].xpos < 0) {
      obs[i] = new Obstacles(width + random(40), random(100, height), random(4, 6));
    }
    if (subs[i].xpos < 0) {
      subs[i] = new Subsidy(width + random(40), random(100, height), random(4, 6));
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
  for (int i = 0; i < subs.length; i++) {
    if (dist(ball1.xpos, ball1.ypos, obs[i].xpos, obs[i].ypos) <= 20 ) {
      ball1.hpDownC();
      obs[i] = new Obstacles(width + random(40), random(100, height), random(4, 6));
    }
    if (dist(ball1.xpos, ball1.ypos, subs[i].xpos, subs[i].ypos) <= 10) {
      ball1.hpUpC();
      subs[i] = new Subsidy(width + random(40), random(100, height), random(4, 6));
    }
    gameState = ball1.liveOrDie(gameState);
  }
}

float moreBlocks(float present, float previous){
  if (present - previous > 10000){
    for (int i = 0; i < 2; i ++){
      obs = (Obstacles[]) append(obs, new Obstacles(width + random(40), random(100, height), random(4, 6)));
      subs = (Subsidy[]) append(subs, new Subsidy(width + random(40), random(100, height), random(4, 6)));
    }
    println(subs.length);
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
