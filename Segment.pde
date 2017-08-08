class Segment{
  float segmentLength = 20, segmentWidth = 5, angle = 90, strength = .08;
  PVector position, velocity;
  Ball ball;
  
  public Segment(Ball ball){
    rectMode(CENTER);
    this.ball = ball;
    position = new PVector(width / 2, height / 2);
    velocity = new PVector(position.x, position.y);
    velocity.normalize();
    println(velocity.y);
  }
  
  public void update(){
    position.add(velocity);
    angle = degrees(velocity.heading()) + 90;
    if(ball.position.x < position.x){
      velocity.x -= strength;
    } else if (ball.position.x > position.x) {
       velocity.x += strength; 
    }
    if(ball.position.y < position.y){
      velocity.y -= strength; 
    } else if (ball.position.y > position.y) {
      velocity.y += strength; 
    }
    if(velocity.x < -1) velocity.x = -1;
    if(velocity.x > 1) velocity.x = 1;
    if(velocity.y < -1) velocity.y = -1;
    if(velocity.y > 1) velocity.y = 1;
  }
  
  public void drawSegment(){
    pushMatrix();
    translate(position.x, position.y);
    rotate(radians(angle));
    rect(0,0, segmentWidth, segmentLength);
    popMatrix();
  }
}