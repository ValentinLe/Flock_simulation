
public abstract class Bird {

  protected float maxForce;
  protected float maxSpeed;
  protected PVector position;
  protected PVector velocity;
  protected PVector acceleration;
  protected float perception;
  
  public Bird(PVector position) {
    this.maxForce = 0.04;
    this.maxSpeed = 4;
    this.position = position;
    this.velocity = PVector.random2D();
    this.acceleration = new PVector();
    this.perception = 100;
  }
  
  public float getMaxForce() {
    return maxForce;
  }
  
  public float getMaxSpeed() {
    return maxSpeed;
  }
  
  public float getX() {
    return position.x;
  }
  
  public float getY() {
    return position.y;
  }
  
  public void setX(float x) {
    position.x = x;
  }
  
  public void setY(float y) {
    position.y = y;
  }
  
  public PVector getPosition() {
    return position;
  }
  
  public PVector getVelocity() {
    return velocity;
  }
  
  public PVector getAcceleration() {
    return acceleration;
  }
  
  public float getPerception() {
    return perception;
  }
  
  public void move(World world) {
    position.add(velocity);
    velocity.add(acceleration);
    velocity.limit(maxSpeed);
    stayInIndex(world);
  }
  
  public void stayInIndex(World world) {
    if (getX() < 0) {
      setX(width);
    } else if (getX() > width) {
      setX(0);
    }
    
    if (getY() < 0) {
      setY(height);
    } else if (getY() > height) {
      setY(0);
    }
  }
  
  public abstract void update(World world);
      
}
