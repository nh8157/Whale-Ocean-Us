int gameState = 0;
//initiating ball
Ball ball1;
// initializing two arrays
Obstacles[] obs;
Subsidy[] subs;

void setup() {
  size(640, 480);
  // initializing two arrays
  obs = new Obstacles[5];
  subs = new Subsidy[5];
  background(0);
}

void draw() {
  // the state of the game stays at the first
  // when the user clicks
  // the state will change again
  if (gameState == 0) {
    background(0);
    text("Welcome to the game", width / 2, height / 2);
    text("Press S to start", width / 2, height / 2 + 10);
    if (keyPressed && key == 's') {
      gameState = 1;
      ball1 = new Ball(0, 200, 7);
      // adding class objects into arrays9
      for (int i = 0; i < 5; i ++) {
        obs[i] = new Obstacles(width + random(40), random(100, height), random(5, 10));
        subs[i] = new Subsidy(width + random(40), random(100, height), random(5, 10));
      }
    }
  } else if (gameState == 1) {
    println(ball1.hp);
    background(255);
    rectMode(CORNER);
    fill(0, 20, 200);
    rect(0, 100, width, height);
    noFill();
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
