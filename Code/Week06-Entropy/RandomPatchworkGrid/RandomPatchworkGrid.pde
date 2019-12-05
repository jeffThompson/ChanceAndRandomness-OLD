
import processing.pdf.*;

int gridSize =       100;
float minDivisions = 2;
float maxDivisions = 20;
float lineMutAmt =   1;
int numFrames =      100;

int whichFrame =     0;


void setup() {  
  size(800,800);
  surface.setLocation(0,0);
  
}

void draw() {
  randomSeed(whichFrame);
  surface.setTitle("Random Patchwork Grid: " + whichFrame);
  
  beginRecord(PDF, "Output/" + nf(whichFrame,4) + ".pdf");
  background(255);
  for (int y=0; y<height; y+=gridSize) {
    for (int x=0; x<width; x+=gridSize) {
      drawGrid(x, y);
    }
  }
  
  noFill();
  stroke(0);
  rect(0,0, width,height);
  endRecord();
  
  whichFrame += 1;
  if (whichFrame == numFrames) {
    noLoop();
  }
}

void drawGrid(int _x, int _y) {  
  pushMatrix();
  translate(_x,_y);
  
  float spacingX = gridSize/random(minDivisions, maxDivisions);
  for (float x=spacingX; x<gridSize-spacingX; x+=spacingX) {
    drawLineVert(x);
  }
  
  float spacingY = gridSize/random(minDivisions, maxDivisions);
  for (float y=spacingY; y<gridSize-spacingY; y+=spacingY) {
    drawLineHoriz(y);
  }
  
  noFill();
  rect(0,0, gridSize,gridSize);
  
  popMatrix();
}

void drawLineVert(float x) {
  stroke(0);
  noFill();
  beginShape();
  vertex(x,0);
  for (float y=0; y<gridSize; y+=20) {
    curveVertex(x,y);
    x += random(-lineMutAmt,lineMutAmt);
  }  
  vertex(x,gridSize);
  endShape();
}

void drawLineHoriz(float y) {
  stroke(0);
  noFill();
  beginShape();
  vertex(0,y);
  for (float x=0; x<gridSize; x+=20) {
    curveVertex(x,y);
    y += random(-lineMutAmt,lineMutAmt);
  }  
  vertex(gridSize,y);
  endShape();
}
