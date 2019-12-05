
void keyPressed() {
  if (key == 'p' || key == 32) {
    paused = !paused;
  }
  else if (key == 's') {
    showSeed = !showSeed;
  }
  else if (key == 'c') {
    showCircles = !showCircles;
  }
}
