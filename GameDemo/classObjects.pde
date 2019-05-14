////////////////////////////BACKGROUND////////////////////////////
class Background {
  PImage img;
  int xpos;
  int speed;
  Background(PImage image, int x) {
    img = image;
    xpos = x;
    speed = 5;
  }
  PImage reimg() {
    return img;
  }
  void move() {
    xpos -= speed;
  }
  void display() {
    image(img, xpos, height / 2);
  }
}

////////////////////////////BALL////////////////////////////

class Ball {
  // initializing the ball
  // if the player hit the block for once
  // its hp will decrease by 25%
  int xpos;
  int ypos;
  int speed;
  int r;
  float hp;
  int G1;
  int G2;
  int G3;
  int G4;
  Ball(int x, int y, int spe) {
    xpos = x;
    ypos = y;
    speed = spe;
    r = 100;
    hp = 100;
    G1 = 0;
    G2 = 0;
    G3 = 0;
    G4 = 0;
  }

  void move(int x, int y, int seaLevel) {
    xpos = x;
    //ypos = y;
    if (y >= seaLevel){
      ypos = y;
   }
}
// if the player hit the block for once
// its hp will decrease by 25%
// the number of each type of garbage eaten
void garbageUp(int i){
  if (i == 0){
    G1 ++;
  } else if (i == 1){
    G2 ++;
  } else if (i == 2){
    G3 ++;
  } else if (i == 3){
    G4 ++;
  }
  
}
void hpDownC() {
  hp -= 5;
}
void hpUpC() {
  if (hp <= 95) {
    hp += 5;
  } else if (hp < 100) {
    hp = 100;
  }
}

int liveOrDie(int gameState) {
  if (hp <= 0) {
    gameState ++;
  }
  return gameState;
}
void display(PImage i) {
  image(i, xpos - 55, ypos +10);
}
}


////////////////////////////OBSTACLES////////////////////////////

class Obstacles {
  float xpos;
  float ypos;
  float speed;
  int r;
  int obClass;
  int displayCount;
  Obstacles(float x, float y, float spe, int obIn) {
    xpos = x;
    ypos = y;
    speed = spe;
    obClass = obIn;
    r = 35;
    displayCount = 0;
  }
  void move() {
    xpos -= speed;
  }
  int reClass(){
    return obClass;
  }
  void display() {
    if (displayCount == 0) {
      if (obClass == 2) {
        ypos = random(seaLevel - 40, seaLevel);
        speed = random(3, 5);
        displayCount ++;
      } else if (obClass == 0) {
        speed = random(8, 10);
      }
    }
    image (garbage[obClass], xpos, ypos);
  }
}

////////////////////////////SUBSIDY////////////////////////////

class Subsidy {
  float xpos;
  float ypos;
  float a;
  float speed;  
  Subsidy(float x, float y, float spd, int sub) {
    xpos = x;
    ypos = y;
    a = 20;
    speed = spd / 2;
  }
  void move() {
    xpos -= speed;
  }
  void display(PImage i) {
    image(i, xpos, ypos);
  }
}
