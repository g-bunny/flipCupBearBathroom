class Player
{
  float x;
  float y;
  float z;
  int maxImages = 8;
  int imageIndex = 0;
  PImage[] walkRight = new PImage[maxImages];
  PImage fail;
  float playerWidth = 200.0;
  float playerHeight = 400.0;

  float displacementX = 0;
  float movementSpeed = 20;

  boolean lastMovedRight;
  boolean lastMovedLeft;
  float startingXpos = smallNumber + playerWidth/2;
  float startingYpos = bigNumber - playerHeight/2;
  float currentYpos = startingYpos; 
  float startingZpos = bigNumber;
  PVector location = new PVector(startingXpos, startingYpos);
  float jumpForce = -20;
  //Timer timer;
  boolean stoppedWalkingResetTimer;
  float angle;

  boolean shouldIStillBeWalking = false;

  boolean playing = true;
  boolean lost = false;
  ;
  boolean win = false;
  ;

  Player(float x, float y) {
    location.x = x;
    location.y = y;
    for (int i = 0; i < walkRight.length; i++) {
      walkRight[i] = loadImage("pm0" + i + ".png");
    }
    fail = loadImage("pPee.png");
  }

  void display() {
    pushMatrix();
    stoppedWalkingResetTimer = false;
    timer.stepTime();
    imageMode(CENTER);
    imageIndex = (imageIndex + 1) % walkRight.length;

    translate(width/2 + displacementX, height/2);
    
    if (score > -3 && score < 3){
      playing = true;
    } else if (score <= -3){
      playing = false;
      lost = true;
    } else if ( score >= 3){
      //playing = false;
      win = true;
    }

    if (timer.stepTimer <=1) {
      shouldIStillBeWalking = true;
    } else {
      shouldIStillBeWalking = false;
    }
    if (playing) {
      if (moveRight == true && shouldIStillBeWalking == true) {
        image(walkRight[imageIndex], location.x, location.y, playerWidth, playerHeight);
        lastMovedRight = true;
        lastMovedLeft = false;
        timer.stepTime();
        //moveRight = false;
        durationOfWalk -= 1;
      }

      if (durationOfWalk == 0) {
        if (moveRight == true) {
          score += 1;
          timer.timerResetWithoutSubtraction();
        }
        if (moveLeft == true) {
          score -= 1;
        }
        moveLeft = false;
        moveRight = false;
        shouldIStillBeWalking = false;
        durationOfWalk = 9;
        stoppedWalkingResetTimer = true;
      }

      if (moveLeft == true && shouldIStillBeWalking == true) {
        scale(-1, 1);
        image(walkRight[imageIndex], -location.x, location.y, playerWidth, playerHeight);
        lastMovedRight = false;
        lastMovedLeft = true;
        timer.stepTime();
        durationOfWalk -= 1;

        //moveLeft = false;
      }

      if ((moveRight == false && moveLeft == false && lastMovedRight == true)||(lastMovedRight == true && shouldIStillBeWalking == false)) {
        image(walkRight[0], location.x, location.y, playerWidth, playerHeight);
        //moveRight = false;
      }
      if (moveRight == false && moveLeft == false && lastMovedRight == false && lastMovedLeft == false) {
        image(walkRight[0], location.x, location.y, playerWidth, playerHeight);
        //moveRight = false;
        //moveLeft = false;
      }

      if ((moveRight == false && moveLeft == false && lastMovedRight == false && lastMovedLeft == true)||(lastMovedLeft == true && shouldIStillBeWalking == false)) {
        scale(-1, 1);
        image(walkRight[0], -location.x, location.y, playerWidth, playerHeight);
        //moveLeft = false;
      }
    }
    
    if (lost){
      image(fail, location.x, location.y, playerWidth, playerHeight);
    }
    popMatrix();
  }

  void move() {
    if (moveRight == true) {
      if (shouldIStillBeWalking) {
        displacementX += movementSpeed;
      }
    }
    if (moveLeft == true) {
      if (shouldIStillBeWalking) {
        displacementX -= movementSpeed;
      }
    }
  }
}