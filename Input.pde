void keyPressed() {
 if (key == CODED) {
   //if (keyCode == LEFT) {
   //  moveLeft = true;
   //}
   if (keyCode == RIGHT) {
     moveRightRightFoot = true;
   }
   if (keyCode == UP){
     moveRightLeftFoot = true;
   }
 }
}

void keyReleased() {
  if (key == CODED) {
  }
}