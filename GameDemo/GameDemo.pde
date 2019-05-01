int gameState = 0;
//initiating ball
Ball ball1;
// initializing two arrays
Obstacles[] obs;
Subsidy[] subs;
float present;
float previous = 0;

void setup() {
  size(1800, 800);
  // initializing two arrays
  background(0);
}

void draw() {
  // the state of the game stays at the first
  // when the user clicks
  // the state will change again
  present = millis();
  if (gameState == 0) {
    
    background(0);
    text("Welcome to the game", width / 2, height / 2);
    text("Press S to start", width / 2, height / 2 + 10);
    obs = new Obstacles[2];
    subs = new Subsidy[2];
    if (keyPressed && key == 's') {
      previous = present;
      gameState = 1;
      ball1 = new Ball(0, 200, 7);
      // adding class objects into arrays9
      for (int i = 0; i < subs.length; i ++) {
        obs[i] = new Obstacles(width + random(40), random(100, height), random(4, 6));
        subs[i] = new Subsidy(width + random(40), random(100, height), random(4, 6));
      }
    }
  } else if (gameState == 1) {
    background(255);
    rectMode(CORNER);
    fill(0, 20, 200);
    rect(0, 100, width, height);
    noFill();
    text(ball1.hp, 10, 10);
    
    // attempting to introduce a rising difficulty
    // use the millis()
    // when the program executes to a point
    // the objects in the obs array will increase
    // the objects in the subs array will decrease
    previous = moreBlocks(present, previous);
    // display ball, obstacles, subsidy
    displayMove();
    // generate new obstacles and subsidy
    // once out of the screen
    generate();
    // user control the ball through keyboard
    control();
    // collision determination
    collision();
    //breathe(previous, present, interval);
  } else {
    background(0);
    text("game over", width/2, height/2);
    text("press B to restart", width/2, height/2 + 20);
    if (keyPressed) {
      if (key == 'b' || key == 'B') {
        gameState = 0;
      }
    }
  }
}
