public class Timer {
  float stepTimer;
  float initialTime;
  float elapsedTime;
  int timeLimit = 10;
  int storedTime;
  int timeLeft;
  int bufferTime;
  int timeDifference;
  
  Timer() {
    initialTime = millis()/1000.0;
  }

  void stepTime() {
    if (moveRight == true) {
      stepTimer = millis()/1000.0 - initialTime;
    } else {
      //if (justMoved == false){
      initialTime = millis()/1000.0;
    }
    //}
    //println("stepTimer = " + stepTimer);
    //println("initialTime = " + initialTime);
  }

  void timerReset() {
    timeLimit += 10;
    storedTime = floor(initialTime);
  }
  
  void timerResetWithoutSubtraction(){
      //timeLimit += floor(initialTime)%10;
 //if(durationOfWalk <= 0){
 //  score += 1;
 //  durationOfWalk = 9;
 //}
  }
}