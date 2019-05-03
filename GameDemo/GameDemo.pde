PImage [] whales = new PImage [40];

int gameState = 0;
//initiating ball 
Ball ball1;
// initializing two arrays\list
ArrayList<Obstacles> obs = new ArrayList<Obstacles>();
ArrayList<Subsidy> subs = new ArrayList<Subsidy>();
float present;
float previous = 0;
int counter = 0;

void setup() {
  size(1800, 800);
  // initializing two arrays
  background(0);
  whales [0]= loadImage("whaleOne.png");
  whales [1]= loadImage("whaleOne.png");
  whales [2]= loadImage("whaleOne.png");
  whales [3]= loadImage("whaleOne.png");
  whales [4]= loadImage("whaleOne.png");
  whales [5]= loadImage("whaleTwo.png");
  whales [6]= loadImage("whaleTwo.png");
  whales [7]= loadImage("whaleTwo.png");
  whales [8]= loadImage("whaleTwo.png");
  whales [9]= loadImage("whaleTwo.png");
  whales [10]= loadImage("whaleThree.png");
  whales [11]= loadImage ("whaleThree.png");
  whales [12]= loadImage ("whaleThree.png");
  whales [13]= loadImage ("whaleThree.png");
  whales [14]= loadImage("whaleThree.png");
  whales [15]= loadImage("whaleFour.png");
  whales [16]= loadImage("whaleFour.png");
  whales [17]= loadImage("whaleFour.png");
  whales [18]= loadImage("whaleFour.png");
  whales [19]= loadImage("whaleFour.png");
  whales [20]= loadImage("whaleFive.png");
  whales [21]= loadImage ("whaleFive.png");
  whales [22]= loadImage ("whaleFive.png");
  whales [23]= loadImage ("whaleFive.png");
  whales [24]= loadImage("whaleFive.png");
  whales[25]= loadImage("whaleFour.png");
  whales [26]= loadImage("whaleFour.png");
  whales [27]= loadImage("whaleFour.png");
  whales [28]= loadImage("whaleFour.png");
  whales [29]= loadImage("whaleFour.png");
  whales [30]= loadImage("whaleThree.png");
  whales [31]= loadImage("whaleThree.png");
  whales [32]= loadImage("whaleThree.png");
  whales [33]= loadImage("whaleThree.png");
  whales [34]= loadImage("whaleThree.png");
  whales [35]= loadImage("whaleTwo.png");
  whales [36]= loadImage("whaleTwo.png");
  whales [37]= loadImage("whaleTwo.png");
  whales [38] =loadImage("whaleTwo.png");
  whales [39] =loadImage("whaleTwo.png");
<<<<<<< HEAD
=======
  frameRate(30);
>>>>>>> a4e85fac97b2f6263cb24992756a5f605d294092
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
    if (keyPressed && key == 's') {
      previous = present;
      gameState = 1;
      ball1 = new Ball(0, 200, 7);
      // adding class objects into arrays9
      for (int i = 0; i < subs.size(); i ++) {
        obs.add(new Obstacles(random(40) + width, random(100, height), random(5, 10)));
        subs.add(new Subsidy(random(40) + width, random(100, height), random(5, 10)));
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
    displayMove(counter);
    // generate new obstacles and subsidy
    // once out of the screen
    generate();
    // user control the ball through keyboard
    control();
    // collision determination
    collision();
    //breathe(previous, present, interval);
    if (counter < 7){
      counter ++;
    } else {
      counter = 0;
    }
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
