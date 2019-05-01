////////////////////////////FUNCTIONS////////////////////////////
void displayMove() {
  for (int i = 0; i < 5; i ++) {
    obs[i].display();
    subs[i].display();
    obs[i].move();
    subs[i].move();
  }
  ball1.display();
}

void generate() {
  for (int i = 0; i < 5; i ++) {
    if (obs[i].xpos < 0) {
      obs[i] = new Obstacles(width + random(40), random(100, height), random(5, 10));
    }
    if (subs[i].xpos < 0) {
      subs[i] = new Subsidy(width + random(40), random(100, height), random(5, 10));
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
  for (int i = 0; i < 5; i++) {
    if (dist(ball1.xpos, ball1.ypos, obs[i].xpos, obs[i].ypos) <= 10 ) {
      ball1.hpDown();
      obs[i] = new Obstacles(width + random(40), random(100, height), random(5, 10));
    }
    if (dist(ball1.xpos, ball1.ypos, subs[i].xpos, subs[i].ypos) <= 10) {
      ball1.hpUp();
      subs[i] = new Subsidy(width + random(40), random(100, height), random(5, 10));
    }
    gameState = ball1.liveOrDie(gameState);
  }
}
