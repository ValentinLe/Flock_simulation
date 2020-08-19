
public class PeacefullBird extends Bird {
  
  public PeacefullBird(PVector position) {
    super(position);
  }
  
  @Override
  public void update(World world) {
    acceleration.set(0, 0);
    PVector align = world.alignment(this, world.getBirds());
    PVector cohesion = world.cohesion(this, world.getBirds());
    PVector separation = world.separation(this, world.getBirds());
    PVector cohesionAgressive = world.cohesion(this, world.getAgressiveBirds());
    align.mult(1.8);
    cohesion.mult(1);
    separation.mult(1.5);
    cohesionAgressive.mult(10);
    acceleration.add(align);
    acceleration.add(cohesion);
    acceleration.add(separation);
    acceleration.sub(cohesionAgressive);
    move(world);
  }
}
