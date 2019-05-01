int gameState = 0;
//initiating ball
Ball ball1;
// initializing two arrays
Obstacles[] obs;
Subsidy[] subs;

void setup(){
  size(640, 480);
  // initializing two arrays
  obs = new Obstacles[5];
  subs = new Subsidy[5];
  background(0);
}

void draw(){
  // the state of the game stays at the first
  // when the user clicks
  // the state will change again
  if (gameState == 0){
    background(0);
    text("Welcome to the game", width / 2, height / 2);
    text("Press S to start", width / 2, height / 2 + 10);
    if (keyPressed && key == 's'){
      gameState = 1;
      ball1 = new Ball(0, 0, 7);
      // adding class objects into arrays9
      for (int i = 0; i < 5; i ++){
        obs[i] = new Obstacles(width + random(40), random(height), random(10));
        subs[i] = new Subsidy(width + random(40), random(height), random(10));
      }
    }
  }
  else if (gameState == 1){
    println(ball1.hp);
    background(255);
    text(ball1.hp, 10, 10);
    // display ball, obstacles, subsidy
    displayMove();
    // generate new obstacles and subsidy
    // once out of the screen
    generate();
    // user control the ball through keyboard
    control();
    // collision determination
    collision();
    }
  else{
    background(0);
    text("game over", width/2, height/2);
    text("press B to restart", width/2, height/2 + 20);
    if (keyPressed){
      if (key == 'b' || key == 'B'){
        gameState = 0;
      }
    }
  }
}

////////////////////////////FUNCTIONS////////////////////////////
void displayMove(){
  for (int i = 0; i < 5; i ++){
    obs[i].display();
    subs[i].display();
    obs[i].move();
    subs[i].move();
  }
  ball1.display();
}

void generate(){
  for (int i = 0; i < 5; i ++){
      if (obs[i].xpos < 0){
        obs[i] = new Obstacles(width + random(40), random(height), random(10));
      }
      if (subs[i].xpos < 0){
        subs[i] = new Subsidy(width + random(40), random(height), random(10));
      }
  }
}

void control(){
  if (keyPressed) {
      if (key == 'w' && ball1.ypos > 0){
        ball1.moveUp();
      }
      if (key == 'a' && ball1.xpos > 0){
        ball1.moveLeft();
      }
      if (key == 's' && ball1.ypos < height - 5){
        ball1.moveDown();
      }
      if (key == 'd' && ball1.xpos < width - 5){
        ball1.moveRight();
      }
    }
}

void collision(){
  for (int i = 0; i < 5; i++){
      if (dist(ball1.xpos, ball1.ypos, obs[i].xpos, obs[i].ypos) <= 10 ){
        ball1.hpDown();
        obs[i] = new Obstacles(width + random(40), random(height), random(10));
      }
      if (dist(ball1.xpos, ball1.ypos, subs[i].xpos, subs[i].ypos) <= 10){
        ball1.hpUp();
        subs[i] = new Subsidy(width + random(40), random(height), random(10));
      }
    gameState = ball1.liveOrDie(gameState);  
    }
}

////////////////////////////BALL////////////////////////////

class Ball{
  // initializing the ball
  // if the player hit the block for once
  // its hp will decrease by 25%
  int xpos;
  int ypos;
  int speed;
  int r;
  int hp;
  Ball(int x, int y, int spe){
    xpos = x;
    ypos = y;
    speed = spe;
    r = 10;
    hp = 100;
  }
  
  // user controlling the movement of the ball
  void moveUp(){
    ypos -= speed;
  }
  void moveDown(){
    ypos += speed;
  }
  void moveLeft(){
    xpos -= speed;
  }
  void moveRight(){
    xpos += speed;
  }
  // if the player hit the block for once
  // its hp will decrease by 25%
  void hpDown(){
    hp -= 25; 
  }
  void hpUp(){
    if (hp < 100){
      hp += 25;
    }
  }
  int liveOrDie(int gameState){
    if (hp == 0){
      gameState = 2;
    }
    return gameState;
  }
  void display(){
    stroke(0);
    fill(255, 0, 0);
    ellipse(xpos, ypos, r, r);
  }
}

////////////////////////////OBSTACLES////////////////////////////

class Obstacles{
  float xpos;
  float ypos;
  float speed;
  
  Obstacles(float x, float y, float spe){
    xpos = x;
    ypos = y;
    speed = spe;
  }
  void move(){
    xpos -= speed;
  }
  void display(){
    fill(255, 255, 0);
    ellipse(xpos, ypos, 10, 10);
  }
}

////////////////////////////SUBSIDY////////////////////////////

class Subsidy{
  float xpos;
  float ypos;
  float a;
  float speed;
  Subsidy(float x, float y, float spd){
    xpos = x;
    ypos = y;
    a = 20;
    speed = spd;
  }
  void move(){
    xpos -= speed;
  }
  void display(){
    fill(0, 0, 255);
    rectMode(CENTER);
    rect(xpos, ypos, a, a);
  }
}
