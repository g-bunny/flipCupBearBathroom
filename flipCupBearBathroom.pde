boolean moveLeft;
boolean moveRightLeftFoot;
boolean moveRightRightFoot;
boolean moveRight;
boolean leftPressed;
boolean rightPressed;
float smallNumber;
float bigNumber;
PImage bg1;
PImage winBg;
PImage timerFrame;
//int maxTime = 11;
//PImage[] countDown = new PImage[maxTime];

int score = 0;
int bufferTime = 0;
int durationOfWalk = 9;

Player player;
Timer timer;

void setup() {
  frameRate(12);
  size(1440, 900);
  player = new Player(0, 180);
  bg1 = loadImage("background.png");
  winBg = loadImage("restroom_page.png");
  timerFrame = loadImage("background_timer.png");
  textSize(100);
  timer = new Timer();
  //for (int i = 1; i < countDown.length; i++) {
  //  countDown[i] = loadImage("00" + i + ".png");
  //}
}
void draw() {
  //if (frameCount % 12 == 0){
  //  timeLeft = timeLimit - 1;
  //}
  timer.timeLeft = timer.timeLimit - floor(timer.initialTime);
  background(255);
  imageMode(CORNER);
  image(bg1, 0, 0, 1440, 900);
  image(timerFrame, width/3 + 60, 0, 414, 317);
  fill(0);
  text(score, width/2 + 100, 200);
  text(timer.timeLeft, width/2 - 100, 200);
  //if (timer.timeLeft > 0 && timer.timeLeft< 10) {
  //  for (int i = 1; i < countDown.length; i++) {
  //    if (timer.timeLeft == i) {
  //      image(countDown[i], width/3 + 60, 0, 210, 168);
  //    }
  //  }
  //}
  if (moveRightRightFoot == true && moveRightLeftFoot == true) {
    moveRight = true;
    moveRightRightFoot = false;
    moveRightLeftFoot = false;
  }

  println("timeLeft: " + timer.timeLeft);
  println("timeLimit: " + timer.timeLimit);

  println("initialTime mod 10: " + floor(timer.initialTime)%10);
  println("initialTime: " + floor(timer.initialTime));
  
  println("moveLeft: " + moveLeft);

  player.display();
  player.move();
  
  if (timer.timeLeft <=0) {
    timer.timerReset();
    moveLeft = true;
    durationOfWalk = 9;
  }
  
  if (player.stoppedWalkingResetTimer == true) {
    timer.timerResetWithoutSubtraction();
  }

  if (player.win) {
    pushMatrix();
    translate(0, 0);
    imageMode(CORNER);
    image(winBg, 0, 0, 1440, 900); 
    popMatrix();
  }
}