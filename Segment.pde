class Segment {
  float x, y, angle, len;
  PVector a;
  PVector b = new PVector();

  public Segment(float x, float y, float angle, float len) {
    this.x = x;
    this.y = y;
    this.angle = angle;
    this.len = len;
    this.a = new PVector(x, y);
    strokeWeight(5);
  }

  private void calculateA() {
    float dx = b.x + len * cos(angle);
    float dy = b.y + len * sin(angle);
    a.set(dx, dy);
  }

  public void calculateB() {
    float dx = a.x + len * cos(angle); 
    float dy = a.y + len * sin(angle);
    b.set(dx, dy);
  }

  public void follow(float targetX, float targetY) {
    float dx = targetX - a.x;
    float dy = targetY - a.y;
    angle = atan2(dy, dx);
    a.x = targetX - len * cos(angle);
    a.y = targetY - len * sin(angle);
  }

  public void returnToFixedPoint(float targetX, float targetY) {
    float dx = targetX - b.x;
    float dy = targetY - b.y;
    angle = atan2(dy, dx);
    b.x = targetX - len * cos(angle);
    b.y = targetY - len * sin(angle);
  }

  public void drawSegment() {
    line(a.x, a.y, b.x, b.y);
    //ellipse((a.x + b.x) / 2, (a.y + b.y) / 2, len, len);
  }
}