int gameState = 0;
Ball ball1;
Obstacles[] obs;

void setup(){
  size(640, 480);
  obs = new Obstacles[5];
  background(0);
}

void draw(){
  // the state of the game stays at the first
  // when the user clicks
  // the state will change again
  if (gameState == 0){
    background(0);
    text("Welcome to the game", width / 2, height / 2);
    if (keyPressed){
      gameState = 1;
      ball1 = new Ball(0, 0, 8);
      for (int i = 0; i < 5; i ++){
        obs[i] = new Obstacles(width + random(40), random(height), random(10));
      }
    }
  }
  else if (gameState == 1){
    background(0);
    for (int i = 0; i < 5; i ++){
      obs[i].display();
      obs[i].move();
    }
    for (int i = 0; i < 5; i ++){
      if (obs[i].xpos < 0){
        obs[i] = new Obstacles(width + random(40), random(height), 2);
      }
    }
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
    ball1.display();
    boolean collide = false;
    for (int i = 0; i < 5; i++){
      if (dist(ball1.xpos, ball1.ypos, obs[i].xpos, obs[i].ypos) <= 10 ){
        collide = true;
      }
      if (collide){
        gameState = 2;
      }
    }
  }
  else{
    background(0);
    text("game over", width/2, height/2);
    text("press any key to restart", width/2, height/2 + 20);
    if (keyPressed){
      if (key == 'b' || key == 'B'){
        gameState = 0;
      }
    }
  }
}



class Ball{
  int xpos;
  int ypos;
  int speed;
  int r;
  Ball(int x, int y, int spe){
    xpos = x;
    ypos = y;
    speed = spe;
    r = 10;
  }
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
  void eat(){
  }
  void display(){
    stroke(0);
    fill(255, 0, 0);
    ellipse(xpos, ypos, r, r);
  }
}
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
    rectMode(CENTER);
    rect(xpos, ypos, 25, 25);
  }
}
