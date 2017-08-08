Ball[] balls;
Segment segment;
void setup(){
  size(800, 800);
  balls = new Ball[1];
  for(int i = 0; i < balls.length; i++) balls[i] = new Ball(5, 2);
  segment = new Segment(balls[0]);
}

void draw(){
  background(0);
  for(Ball b : balls){
    b.update();
    b.draw();
  }
  segment.update();
  segment.drawSegment();
}