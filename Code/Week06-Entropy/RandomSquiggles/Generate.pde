
void generate() {
  String baseFilename = randomSeed + "seed_" + moveAmt + "move_" + angleAmt + "angle_" + numLines + "lines_" + numCircles + "circles_" + numIterations + "numIterations_" + minRadius + "-" + maxRadius + "radius";
  if (saveImages) {
    beginRecord(PDF, "PDFs/" + baseFilename + ".pdf");
  }

  // create lines
  randomSeed(randomSeed);
  lines = new ArrayList<Line>();
  for (int i=0; i<numLines; i++) {
    Line l = new Line();
    lines.add(l);
  }

  // create force-field circles and push lines
  // away from them
  PVector[] circles = new PVector[numCircles];
  for (int i=0; i<circles.length; i++) {
    float radius = random(minRadius, maxRadius);
    float x = random(0, width);
    float y = random(0, height);
    circles[i] = new PVector(x, y, radius);
  }
  for (int i=0; i<numIterations; i++) {
    for (PVector circle : circles) {
      for (Line l : lines) {
        l.update(circle.x, circle.y, circle.z);
      }
    }
  }

  // draw it!
  background(255);
  for (Line l : lines) {
    l.display();
  }

  // save pdf and png
  if (saveImages) {
    endRecord();
    save("PNGs/" + baseFilename + ".png");
  }

  if (showCircles) {
    for (PVector c : circles) {
      fill(255, 150, 0, 30);
      noStroke();
      ellipse(c.x, c.y, c.z, c.z);
    }
  }

  // erode
  //for (int i=0; i<numDilateSteps; i++) {
  //  filter(DILATE);
  //}
  //save("Eroded/" + baseFilename + ".png");
}
