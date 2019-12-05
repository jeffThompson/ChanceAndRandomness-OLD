
/*
RANDOM SQUIGGLES
Jeff Thompson | 2019 | jeffreythompson.org


*/


import processing.pdf.*;

int pageWidth =       10;            // in inches, 72 dpi
int pageHeight =      10;

int numLines =        40;            // total # lines to generate
int maxSeed =         100;           // how many images to create

float moveAmt =       2;             // move amount along line
float angleAmt =      radians(30);   // angle change in line (tightness of curves)

int numCircles =      200;           // # force-field circles to generate
int minRadius =       20;            // min/max radius of circles
int maxRadius =       100;
int numIterations =   30;            // # iterations pushing lines from circles

int numDilateSteps =  1;

color strokeColor =   color(0, 60);

boolean paused =      false;
boolean showSeed =    false;
boolean showCircles = false;
boolean saveImages =  true;

ArrayList<Line> lines;
int randomSeed = 0;
PFont font;


void settings() {
  size(pageWidth*72, pageHeight*72);
}


void setup() {
  surface.setLocation(0, 0);
  
  font = loadFont("CooperHewitt-Heavy-240.vlw");
  textFont(font, 240);
  textAlign(CENTER, CENTER);
}

void draw() {
  if (randomSeed < maxSeed && !paused) {
    generate();
    randomSeed += 1;
    
    // display seed value (will not show up
    // in exported images)
    if (showSeed) {
      color from = color(255,150,0);
      color to =   color(0,150,255);
      float pct =  map(randomSeed, 0,maxSeed, 0,1);
      fill( lerpColor(from, to, pct) );
      noStroke();
      text(randomSeed, width/2,height/2);
    }
  }
}
