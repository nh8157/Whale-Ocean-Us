////////////////////////////BALL////////////////////////////
class Background{
  PImage img;
  int xpos;
  int speed;
  Background(PImage image, int x){
    img = image;
    xpos = x;
    speed = 5;
  }
  PImage reimg(){
    return img;
  }
  void move(){
    xpos -= speed;
  }
  void out(){
    xpos = width / 2;
  }
  void display(){
    image(img, xpos, height / 2);
  }
}
class Ball {
  // initializing the ball
  // if the player hit the block for once
  // its hp will decrease by 25%
  int xpos;
  int ypos;
  int speed;
  int r;
  int hp;
  int bre;
  Ball(int x, int y, int spe) {
    xpos = x;
    ypos = y;
    speed = spe;
    r = 100;
    hp = 100;
    bre = 30;
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
  void hpDownC() {
    hp -= 25;
  }
  void hpUpC() {
    if (hp < 100) {
      hp += 25;
    }
  }
  void breatheUpB() {
    if (hp != 100){
      hpUpC();
    } else if(bre < 30){
      bre += 10;
    }
  }
  void breatheDownB() {
    if (bre == 0){
      hpDownC();
    } else {
      bre -= 10;
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
    image(i, xpos - 55, ypos +10);
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
    r = 35;
  }
  void move() {
    xpos -= speed;
  }
  void display() {
    //fill(255, 255, 0);
    image (bag, xpos, ypos, r,r);

    
    //ellipse(xpos, ypos, r, r);
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
