PImage bag ;

PImage [] whales = new PImage [65];
PImage [] garbage = new PImage [4];
PImage [] food = new PImage [2];

import gab.opencv.*;
import processing.video.*;
import java.awt.Rectangle;

Capture video;
OpenCV opencv;
PImage src, colorFilteredImage;
ArrayList<Contour> contours;

int gameState = 0;
//initiating ball 
Ball ball1;
// initializing two arrays\list
ArrayList<Obstacles> obs = new ArrayList<Obstacles>();
ArrayList<Subsidy> subs = new ArrayList<Subsidy>();
ArrayList<Background> bg = new ArrayList <Background>();
ArrayList<PImage> seaFood = new ArrayList<PImage>();
ArrayList<PImage> bgReserve = new ArrayList<PImage>();

float present;
float previous0 = 0;
float previous1 = 0;
float previous2 = 0;
int counter0;
int counter1 = 0;
int counter2 = 0;
int count0;
int count1;
int subCount = 0;
int seaLevel;
float[] brePara = new float[2];
float[] hunPara = new float[2];
int x;
int y;

void setup() {
  size(1280, 720);
  // initializing two arrays
  video = new Capture(this, 1280, 720);
  video.start();
  opencv = new OpenCV(this, video.width, video.height);
  contours = new ArrayList<Contour>();
  seaLevel = 250;
  background(0);
  count0 = 0;
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
  food [0] = loadImage("C1.png");
  food [1] = loadImage("C2.png");
  for (int i = 0; i < 4; i ++){
    garbage[i] = loadImage("G" + str(i + 1) + ".png");
  }  
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
      ball1 = new Ball(0, 450, 7);
      imageMode(CENTER);
      if (count0 != 0){
        obs.clear();
        subs.clear();
        bg.clear();
        bgReserve.clear();
        seaFood.clear();
      }
      seaFood.add(loadImage("C1.png"));
      seaFood.add(loadImage("C2.png"));
      bgReserve.add(loadImage("BG1.jpg"));
      bgReserve.add(loadImage("BG2.jpg"));
      bgReserve.add(loadImage("BG1.jpg"));
      bgReserve.add(loadImage("BG2.jpg"));
      bgReserve.add(loadImage("BG1.jpg"));
      bgReserve.add(loadImage("BG2.jpg"));
      bgReserve.add(loadImage("BG4.jpg"));
      bgReserve.add(loadImage("BG3.jpg"));
      bgReserve.add(loadImage("BG4.jpg"));
      bgReserve.add(loadImage("BG3.jpg"));
      bgReserve.add(loadImage("BG4.jpg"));
      bgReserve.add(loadImage("BG3.jpg"));
      bgReserve.add(loadImage("BG4.jpg"));
      bgReserve.add(loadImage("BG3.jpg"));
      bgReserve.add(loadImage("BG5.jpg"));
      bgReserve.add(loadImage("BG6.jpg"));
      bgReserve.add(loadImage("BG5.jpg"));
      bgReserve.add(loadImage("BG6.jpg"));
      bgReserve.add(loadImage("BG5.jpg"));
      bgReserve.add(loadImage("BG6.jpg"));
      bgReserve.add(loadImage("BG5.jpg"));
      bgReserve.add(loadImage("BG6.jpg"));
      bgReserve.add(loadImage("BG5.jpg"));
      bgReserve.add(loadImage("BG6.jpg"));
      for (PImage bgR : bgReserve){
        bgR.resize(width, height);
      }
      for (int i = 0; i < 2; i ++){
        PImage img = bgReserve.get(0);
        if (i == 0){
          bg.add(new Background(img, width / 2));
        } else {
          bg.add(new Background(img, width * 3 / 2));
        }
        
      }
      // adding class objects into arrays
      for (int i = 0; i < 2; i ++) {
        int[] classifier = classifier();
        int obIn = classifier[0];
        obs.add(new Obstacles(random(40) + width, random(seaLevel, height), random(5, 10), obIn));
        subs.add(new Subsidy(random(40) + width, random(seaLevel, height), random(5, 10)));
      }
    }
  } else if (gameState == 1) {
    //displayBG(bgReserve, bg);
    imageMode(CENTER);
    //print("bg");
    //println(bg.size());
    //print("bgReserve");
    //println(bgReserve.size());
    if (video.available()) {
      video.read();
    }

    // <2> Load the new frame of our movie in to OpenCV
    opencv.loadImage(video);
    
    // Tell OpenCV to use color information
    opencv.useColor();
    src = opencv.getSnapshot();
    
    // <3> Tell OpenCV to work in HSV color space.
    opencv.useColor(HSB);
    
    // <4> Copy the Hue channel of our image into 
    //     the gray channel, which we process.
    opencv.setGray(opencv.getH().clone());
    
    // <5> Filter the image based on the range of 
    //     hue values that match the object we want to track.
    opencv.inRange(175, 181);
    
    // <6> Get the processed image for reference.
    colorFilteredImage = opencv.getSnapshot();
    
    ///////////////////////////////////////////
    // We could process our image here!
    // See ImageFiltering.pde
    ///////////////////////////////////////////
    
    // <7> Find contours in our range image.
    //     Passing 'true' sorts them by descending area.
    contours = opencv.findContours(true, true);
    
    // <8> Display background images
   // image(src, 0, 0);
    //image(colorFilteredImage, src.width, 0);
    
    // <9> Check to make sure we've found any contours
    if (contours.size() > 0) {
      // <9> Get the first contour, which will be the largest one
      Contour biggestContour = contours.get(0);
      
      // <10> Find the bounding box of the largest contour,
      //      and hence our object.
      Rectangle r = biggestContour.getBoundingBox();
      x = r.x + r.width/2;
      y = r.y + r.height/2;
    }
    for (int i = 0; i < 2; i ++){
      Background back = bg.get(i); 
      back.display();
      back.move();
      if (back.xpos == -width / 2){
        bg.remove(i);
        PImage new_img = bgReserve.get(0); 
        bgReserve.remove(i);
        bg.add(new Background(new_img, width * 3 / 2));
      }
    }
    // need to use graphics to show the demonstrate the blood left
    text(ball1.hp, 30, 30);
    text(ball1.bre, 30, 50);
    // attempting to introduce a rising difficulty
    // use the millis()
    // when the program executes to a point
    // the objects in the obs array will increase
    // the objects in the subs array will decrease
    previous1 = moreBlocks(present, previous1, seaLevel);
    brePara = breathe(present, brePara, seaLevel);
    // display ball, obstacles, subsidy
    subCount = displayMove(counter0, subCount);
    // generate new obstacles and subsidy
    // once out of the screen
    generate(seaLevel);
    // user control the ball through keyboard
    control(x, y);
    // collision determination
    hunPara[1] = collision(counter2, seaLevel);
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
