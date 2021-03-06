////////////////////////////FUNCTIONS////////////////////////////
int displayMove(int counter, int subCount) {
  for (Obstacles ob : obs) {
    ob.display();
    ob.move();
  }
  for (Subsidy sub : subs) {
    sub.display(food[subCount]);
    sub.move();
  }
  if (subCount == 0) {
    subCount = 1;
  } else {
    subCount = 0;
  }
  ball1.display(whales[counter]);
  return subCount;
}

void generate(int seaLevel) {
  for (int i = 0; i < obs.size(); i ++) {
    Obstacles ob = obs.get(i);
    int[] classifier = classifier();
    int obIn = classifier[0];
    if (ob.xpos < 0) {
      obs.remove(i);
      obs.add(new Obstacles(width + random(40), random(seaLevel, height), random(5, 10), obIn));
    }
  }
  for (int i = 0; i < subs.size(); i ++) {
    Subsidy sub = subs.get(i);
    int[] classifier = classifier();
    int subIn = classifier[1];
    if (sub.xpos < 0) {
      subs.remove(i);
      subs.add(new Subsidy(width + random(40), random(seaLevel, height), random(5, 10), subIn));
    }
  }
}
// differnet gargage might be generated
// at this moment
// it will generate different kinds of garbages
int collision(float previous2, int seaLevel) {
  vibration = 0;
  int time = 0;
  for (int i = 0; i < subs.size(); i++) {
    Obstacles ob = obs.get(i);
    Subsidy sub = subs.get(i);
    float ob1 = dist(ob.xpos + 26, ob.ypos, ball1.xpos, ball1.ypos);
    float ob2 = dist(ob.xpos - 26, ob.ypos, ball1.xpos, ball1.ypos);
    int[] classifier = classifier();
    int obIn = classifier[0];
    int subIn = classifier[1];
    if (ob1 + ob2 <= 60 + ob.r) {
      // still necessary to keep this function?
      myPort.write('H');
      ball1.garbageUp(ob.reClass());
      for (int m = 0; m < 2 * (4 - ob.obClass); m ++) {
        ball1.hpDownC();
        myPort.write('H');
      } 
      myPort.write('H');
      obs.remove(i);
      obs.add(new Obstacles(width + random(40), random(seaLevel, height), random(4, 6), obIn));
    } else {
      myPort.write('L');
    }
    if (dist(ball1.xpos, ball1.ypos, sub.xpos, sub.ypos) <= 30) {
      ball1.hpUpC();
      subs.remove(i);
      subs.add(new Subsidy(width + random(40), random(seaLevel, height), random(4, 6), subIn));
    } 
    gameState = ball1.liveOrDie(gameState);
  }
  return vibration;
}

// garbage is according to the random number generated
// the obstacles will be generated more
// the subsidy will be fewer and fewer
float moreBlocks(float present, float previous, int seaLevel) {
  if (present - previous > 10000) {
    for (int i = 0; i < 2; i ++) {
      int[] classifier = classifier();
      int obIn = classifier[0];

      obs.add(new Obstacles(width + random(40), random(seaLevel, height), random(4, 6), obIn));
    }
    int[] classifier = classifier();
    int subIn = classifier[1];
    subs.add(new Subsidy(width + random(40), random(seaLevel, height), random(4, 6), subIn));
    println(subs.size());
    previous = present;
  }
  return previous;
}

float[] hunger(float present, float[] Para) {
  float count = Para[1];
  float previous = Para[0];
  int[] intervals = {5000, 4000, 2000, 1000};
  if (present - previous >= intervals[int(count)]) {
    ball1.hpDownC();
  }
  Para[0] = present;
  Para[1] = count;
  return Para;
}

void breathe(int seaLevel) {
  if (ball1.ypos <= seaLevel + 5) {
    ball1.hp += 0.05;
  }
}

// random generator for the determination of garbage type
int[] classifier() {
  float obRandom = random(10);
  float subRandom = random(10);
  int obIn;
  int subIn;
  if (obRandom <= 10 && obRandom > 8) {
    obIn = 0;
  } else if (obRandom <= 8 && obRandom > 6) {
    obIn = 1;
  } else if (obRandom <= 6 && obRandom > 4) {
    obIn = 2;
  } else {
    obIn = 3;
  }
  if (subRandom <= 10 && subRandom > 9) {
    subIn = 0;
  } else if (subRandom <= 9 && subRandom > 7) {
    subIn = 1;
  } else if (subRandom <= 7 && subRandom > 4) {
    subIn = 2;
  } else {
    subIn = 3;
  }
  int[] classifier = {obIn, subIn};
  return classifier;
}
