
public class AgressiveBird extends Bird {
  
  public AgressiveBird(PVector position) {
    super(position);
    this.perception = 120;
    this.maxSpeed = 3;
    this.maxForce = 0.06;
  }
  
  @Override
  public void update(World world) {
    Bird nearestBird = null;
    for (Bird bird : world.getBirds()) {
      float d = dist(getX(), getY(), bird.getX(), bird.getY());
      if (d < perception) {
        nearestBird = bird;
      }
    }
    PVector separation = world.separation(this, world.getAgressiveBirds());
    separation.mult(4);
    acceleration.add(separation);
    if (nearestBird != null) {
      PVector dest = new PVector();
      dest.add(nearestBird.getPosition());
      dest.sub(position);
      acceleration.add(dest);
    }
    acceleration.limit(maxForce);
    move(world);
  }
}
