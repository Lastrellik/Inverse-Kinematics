class Ball{
  private PVector position;
  private PVector velocity;
  private float radius;
  
  public Ball(float radius, float speed){
    position = new PVector(random(radius, width - radius), random(radius, height - radius));
    velocity = PVector.random2D().normalize();
    this.radius = radius;
    velocity.mult(speed);
  }
  
  public void update(){
     accountForWall();
     position.add(velocity);
  }
  
  public void draw(){
     ellipse(position.x, position.y, radius * 2, radius * 2);    
  }
  
  public void accountForWall(){
     if(position.x < radius) velocity.x *= -1;
     if(position.x > width - radius) velocity.x *= -1;
     if(position.y < radius) velocity.y *= -1;
     if(position.y > height - radius) velocity.y *= -1;
  }
  
  public float getX(){
    return position.x; 
  }
  
  public float getY(){
    return position.y;
  }
}