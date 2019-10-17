
/*
SOL LEWITT WALL DRAWING
Jeff Thompson | 2017 | jeffreythompson.org

A code re-creation of Sol Lewitt's 1971 wall
drawing instructions, carried out at the Boston
Museum.

"On a wall surface, any continuous stretch of wall,
using a hard pencil, place fifty points at random.
The points should be evenly distributed over the
area of the wall. All of the points should be
connected by straight lines."

*/

int numPoints = 50;

void setup() {
  size(1200, 500);
  background(255);
  
  // create random points, draw to screen
  fill(70);
  noStroke();
  PVector[] points = new PVector[numPoints];
  for (int i=0; i<numPoints; i++) {
    points[i] = new PVector(random(0,width), random(0,height));
    ellipse(points[i].x, points[i].y, 10,10);
  }
  
  // draw lines between every point
  noFill();
  stroke(70, 50);
  for (int i=0; i<numPoints; i++) {
    for (int j=0; j<numPoints; j++) {
      if (i == j) continue; 
      line(points[i].x, points[i].y, points[j].x, points[j].y);
    }
  }
}