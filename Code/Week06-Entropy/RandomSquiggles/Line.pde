
class Line {  
  ArrayList<PVector> points;
  
  Line() {
    points = new ArrayList<PVector>();
    
    float x = random(0,width);
    float y = random(0,height);
    points.add( new PVector(x,y) );
    
    float angle = random(0, TWO_PI);
    while (x >= 0 && x <= width && y >= 0 && y <= height) {
      angle += random(-angleAmt, angleAmt);
      x = x + cos(angle) * moveAmt;
      y = y + sin(angle) * moveAmt;
      points.add( new PVector(x,y) );
    }
  }
  
  void update(float cx, float cy, float radius) {
    PVector center = new PVector(cx, cy);
    for (PVector pt : points) {
      float dist = PVector.dist(center, pt);
      if (dist < radius) {
        PVector direction = PVector.sub(center, pt);
        direction.normalize();
        direction.mult(-1);
        pt.add(direction);
      }
    }
  }
  
  void display() {
    stroke(strokeColor);
    noFill();
    beginShape();
    PVector start = points.get(0);
    vertex(start.x, start.y);
    vertex(start.x, start.y);
    for (int i=1; i<points.size()-1; i++) {
      PVector pt = points.get(i);
      curveVertex(pt.x, pt.y);
    }
    PVector end = points.get(points.size()-1);
    vertex(end.x, end.y);
    vertex(end.x, end.y);
    endShape();
  }
}

    
