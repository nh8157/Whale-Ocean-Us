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
  //void moveUp() {
  //  ypos -= speed;
  //}
  //void moveDown() {
  //  ypos += speed;
  //}
  //void moveLeft() {
  //  xpos -= speed;
  //}
  //void moveRight() {
  //  xpos += speed;
  //}
  void move(int x, int y, int seaLevel) {
    xpos = x;
    //ypos = y;
    if (y >= seaLevel){
      ypos = y;
   }
}
// if the player hit the block for once
// its hp will decrease by 25%
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
void breatheUpB() {
  if (hp != 100) {
    hpUpC();
  } else if (bre < 30) {
    bre += 10;
  }
}
void breatheDownB() {
  if (bre == 0) {
    hpDownC();
  } else {
    bre -= 10;
  }
}
int liveOrDie(int gameState) {
  if (hp <= 0) {
    gameState = 2;
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
    image (garbage[obClass], xpos, ypos, r, r);
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
    speed = spd / 2;
  }
  void move() {
    xpos -= speed;
  }
  void display(PImage i) {
    fill(0, 255, 0);
    image(i, xpos, ypos);
  }
}
