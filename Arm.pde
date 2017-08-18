class Arm {
  
  private int len;
  private int segmentLength = 100;
  private float fixedPointX, fixedPointY;
  Segment[] segments;

  public Arm(float fixedPointX, float fixedPointY, int len) {
    this.fixedPointX = fixedPointX;
    this.fixedPointY = fixedPointY;
    this.len = len;
    segments = new Segment[len];
    buildSegments();
  }

  public Arm(int len) {
    this.len = len;
    segments = new Segment[len];
    buildSegments();
  }

  private void buildSegments() {
    for (int i = 0; i < segments.length; i++) {
      segments[i] = new Segment(width / 2, len / 2, 0, segmentLength);
    }
  }

  public void follow(float x, float y) {
    segments[0].follow(x, y);
    segments[0].calculateB();
    for (int i = 1; i < segments.length; i++) {
      segments[i].follow(segments[i - 1].a.x, segments[i - 1].a.y); 
      segments[i].calculateB();
    }
  }

  public void returnToFixedPoint(float x, float y) {
    segments[segments.length - 1].returnToFixedPoint(x, y);
    segments[segments.length - 1].calculateA();
    for (int i = segments.length - 2; i >= 0; i--) {
      segments[i].returnToFixedPoint(segments[i + 1].b.x, segments[i + 1].b.y);
      segments[i].calculateA();
    }
  }
  
  public void returnToFixedPoint(){
     returnToFixedPoint(fixedPointX, fixedPointY);
  }

  public void drawArm() {
    for (Segment s : segments) {
      s.drawSegment();
    }
  }

  public void setSegmentLength(int segmentLength) {
    this.segmentLength = segmentLength;
    buildSegments();
  }
}