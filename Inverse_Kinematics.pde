Ball[] balls;
Arm[] arms;
int numOfItems = 5;
int numOfSegments = 50;
int segmentLength = 10;
int ballRadius = 5;
int ballSpeed = 5;

void setup(){
  size(800, 800);
  balls = new Ball[numOfItems];
  arms = new Arm[numOfItems];
  for(int i = 0; i < numOfItems; i++) {
    balls[i] = new Ball(ballRadius, ballSpeed);
    arms[i] = new Arm(width / 2, height, numOfSegments);
    arms[i].setSegmentLength(segmentLength);
  }
}

void draw(){
  background(52);
  stroke(255);
  for(int i = 0; i < numOfItems; i++){
    balls[i].update();
    balls[i].draw();
    arms[i].follow(balls[i].getX(), balls[i].getY());
    arms[i].returnToFixedPoint();
    arms[i].drawArm();
  }
}