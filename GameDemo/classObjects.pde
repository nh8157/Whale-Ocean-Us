////////////////////////////BALL////////////////////////////

class Ball {
  // initializing the ball
  // if the player hit the block for once
  // its hp will decrease by 25%
  int xpos;
  int ypos;
  int speed;
  int r;
  int hp;
  Ball(int x, int y, int spe) {
    xpos = x;
    ypos = y;
    speed = spe;
    r = 10;
    hp = 100;
  }

  // user controlling the movement of the ball
  void moveUp() {
    ypos -= speed;
  }
  void moveDown() {
    ypos += speed;
  }
  void moveLeft() {
    xpos -= speed;
  }
  void moveRight() {
    xpos += speed;
  }
  // if the player hit the block for once
  // its hp will decrease by 25%
  void hpDown() {
    hp -= 25;
  }
  void hpUp() {
    if (hp < 100) {
      hp += 25;
    }
  }
  int liveOrDie(int gameState) {
    if (hp == 0) {
      gameState = 2;
    }
    return gameState;
  }
  void display() {
    stroke(0);
    fill(255, 0, 0);
    ellipse(xpos, ypos, r, r);
  }
}

////////////////////////////OBSTACLES////////////////////////////

class Obstacles {
  float xpos;
  float ypos;
  float speed;

  Obstacles(float x, float y, float spe) {
    xpos = x;
    ypos = y;
    speed = spe;
  }
  void move() {
    xpos -= speed;
  }
  void display() {
    fill(255, 255, 0);
    ellipse(xpos, ypos, 10, 10);
  }
}

////////////////////////////SUBSIDY////////////////////////////

class Subsidy {
  float xpos;
  float ypos;
  float a;
  float speed;
  Subsidy(float x, float y, float spd) {
    xpos = x;
    ypos = y;
    a = 20;
    speed = spd;
  }
  void move() {
    xpos -= speed;
  }
  void display() {
    fill(0, 0, 255);
    rectMode(CENTER);
    rect(xpos, ypos, a, a);
  }
}