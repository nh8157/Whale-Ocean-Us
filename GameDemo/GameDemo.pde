PImage bag ;
PImage bbt;
PImage cd; 
PImage tube;
PImage shampoo;
PImage [] whales = new PImage [65];

int gameState = 0;
//initiating ball 
Ball ball1;
// initializing two arrays\list
ArrayList<Obstacles> obs = new ArrayList<Obstacles>();
ArrayList<Subsidy> subs = new ArrayList<Subsidy>();
ArrayList<Background> bg = new ArrayList <Background>(); 
PImage img1;
PImage img2;
float present;
float previous0 = 0;
float previous1 = 0;
float previous2 = 0;
int counter0;
int counter1 = 0;
int counter2 = 0;
int count0;
int count1;
int seaLevel;
float[] brePara = new float[2];
float[] hunPara = new float[2];

void setup() {
  size(1800, 800);
  // initializing two arrays
  seaLevel = 300;
  background(0);
  bag = loadImage("bag.png");
  bbt = loadImage("yidiandian.png");
  cd = loadImage ("cd.png");
  tube = loadImage("tube.png");
  shampoo = loadImage("dove.png");
  count0 = 0;
  img1 = loadImage("BG1.jpg");
  img1.resize(1800, 800);
  whales [0]= loadImage("0.png");
  whales [1]= loadImage("0.png");
  whales [2]= loadImage("0.png");
  whales [3]= loadImage("0.png");
  whales [4]= loadImage("0.png");
  whales [5]= loadImage("1.png");
  whales [6]= loadImage("1.png");
  whales [7]= loadImage("1.png");
  whales [8]= loadImage("1.png");
  whales [9]= loadImage("1.png");
  whales [10]= loadImage("2.png");
  whales [11]= loadImage ("2.png");
  whales [12]= loadImage ("2.png");
  whales [13]= loadImage ("2.png");
  whales [14]= loadImage("2.png");
  whales [15]= loadImage("3.png");
  whales [16]= loadImage("3.png");
  whales [17]= loadImage("3.png");
  whales [18]= loadImage("3.png");
  whales [19]= loadImage("3.png");
  whales [20]= loadImage("4.png");
  whales [21]= loadImage ("4.png");
  whales [22]= loadImage ("4.png");
  whales [23]= loadImage ("4.png");
  whales [24]= loadImage("4.png");
  whales [25]= loadImage("5.png");
  whales [26]= loadImage("5.png");
  whales [27]= loadImage("5.png");
  whales [28]= loadImage("5.png");
  whales [29]= loadImage("5.png");
  whales [30]= loadImage("6.png");
  whales [31]= loadImage("6.png");
  whales [32]= loadImage("6.png");
  whales [33]= loadImage("6.png");
  whales [34]= loadImage("6.png");
  whales [35]= loadImage("5.png");
  whales [36]= loadImage("5.png");
  whales [37] =loadImage("5.png");
  whales [38] =loadImage("5.png");
  whales [39] =loadImage("5.png");
  whales [40] =loadImage("4.png");
  whales [41] =loadImage("4.png");
  whales [42] =loadImage("4.png");
  whales [43] =loadImage("4.png");
  whales [44] =loadImage("4.png");
  whales [45] =loadImage("3.png");
  whales [46] =loadImage("3.png");
  whales [47] =loadImage("3.png");
  whales [48] =loadImage("3.png");
  whales [49] =loadImage("3.png");
  whales [50] =loadImage("2.png");
  whales [51] =loadImage("2.png");
  whales [52] =loadImage("2.png");
  whales [53] =loadImage("2.png");
  whales [54] =loadImage("2.png");
  whales [55] =loadImage("1.png");
  whales [56] =loadImage("1.png");
  whales [57] =loadImage("1.png");
  whales [58] =loadImage("1.png");
  whales [59] =loadImage("1.png");
  whales [60] =loadImage("0.png");
  whales [61] =loadImage("0.png");
  whales [62] =loadImage("0.png");
  whales [63] =loadImage("0.png");
  whales [64] =loadImage("0.png");
  for (int i = 0; i < whales.length; i ++){
    whales[i].resize(175, 100);
  }
  count0 ++;
}

void draw() {
  // the state of the game stays at the first
  // when the user clicks
  // the state will change again
  //image(img2, width / 2, height / 2);
  present = millis();
  if (gameState == 0) {
    counter0 = 0;
    background(0);
    text("Welcome to the game", width / 2, height / 2);
    text("Press S to start", width / 2, height / 2 + 10);
    if (keyPressed && key == 's') {
      previous0 = present;
      previous1 = present;
      previous2 = present;
      brePara[0] = previous1;
      brePara[1] = counter1;
      hunPara[0] = previous2;
      hunPara[1] = counter2;
      gameState = 1;
      ball1 = new Ball(0, 300, 7);
      imageMode(CENTER);
      
      if (count0 != 0){
        obs.clear();
        subs.clear();
        bg.clear();
      }
      // adding class objects into arrays
      bg.add(new Background(img1, width / 2));
      bg.add(new Background(img1, width * 3 / 2));
      for (int i = 0; i < 2; i ++) {
        obs.add(new Obstacles(random(40) + width, random(seaLevel, height), random(5, 10)));
       
        subs.add(new Subsidy(random(40) + width, random(seaLevel, height), random(5, 10)));
      }
    }
  } else if (gameState == 1) {
    displayBG();
    text(ball1.hp, 30, 30);
    text(ball1.bre, 30, 50);
    // attempting to introduce a rising difficulty
    // use the millis()
    // when the program executes to a point
    // the objects in the obs array will increase
    // the objects in the subs array will decrease
    previous1 = moreBlocks(present, previous1);
    brePara = breathe(present, brePara, seaLevel);
    // display ball, obstacles, subsidy
    displayMove(counter0);
    // generate new obstacles and subsidy
    // once out of the screen
    generate();
    // user control the ball through keyboard
    control();
    // collision determination
    hunPara[1] = collision(counter2);
    hunPara = hunger(present, hunPara);
    if (counter0 < 64){
      counter0 ++;
    } else {
      counter0 = 0;
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
