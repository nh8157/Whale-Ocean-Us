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
    r = 100;
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
  void hpDownB(){
    hp -= 5;
  }
  void hpDownC() {
    hp -= 25;
  }
  void hpUpB() {
    if (hp < 100){
      hp += 5;
    }
  }
  void hpUpC() {
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
  void display(PImage i) {
    stroke(0);
    fill(255, 0, 0);
    ellipse(xpos, ypos, r * 3 / 5, (r - 25) / 2.5);
    image(i, xpos - 138, ypos - 40, r * 3.5 / 2, r);
  }
}

////////////////////////////OBSTACLES////////////////////////////

class Obstacles {
  float xpos;
  float ypos;
  float speed;
  int r;
  Obstacles(float x, float y, float spe) {
    xpos = x;
    ypos = y;
    speed = spe;
    r = 10;
  }
  void move() {
    xpos -= speed;
  }
  void display() {
    fill(255, 255, 0);
    ellipse(xpos, ypos, r, r);
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
    fill(0, 255, 0);
    rectMode(CENTER);
    rect(xpos, ypos, a, a);
  }
}
