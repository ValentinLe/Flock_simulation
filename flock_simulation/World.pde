
import java.util.*;
import java.lang.reflect.*;

public class World {

  protected List<Bird> birds;
  protected List<Bird> agressiveBirds;
  
  public World(int nb_birds, int nb_agressive) {
    this.birds = getNPeacefullBirds(nb_birds);
    this.agressiveBirds = getNAgressiveBirds(nb_agressive);
  }
  
  public List<Bird> getBirds() {
    return birds;
  }
  
  public List<Bird> getAgressiveBirds() {
    return agressiveBirds;
  }
  
  private List<Bird> getNPeacefullBirds(int n) {
    List<Bird> generatedBirds = new ArrayList();
    for (int i = 0; i < n; i++) {
      Bird bird = new PeacefullBird(new PVector(random(width), random(height)));
      generatedBirds.add(bird);
    }
    return generatedBirds;
  }
  
  private List<Bird> getNAgressiveBirds(int n) {
    List<Bird> generatedBirds = new ArrayList();
    for (int i = 0; i < n; i++) {
      Bird bird = new AgressiveBird(new PVector(random(width), random(height)));
      generatedBirds.add(bird);
    }
    return generatedBirds;
  }
  
  public PVector alignment(Bird bird, List<Bird> otherBirds) {
    PVector align = new PVector();
    int cpt = 0;
    for (Bird b : otherBirds) {
      float d = dist(bird.getX(), bird.getY(), b.getX(), b.getY());
      if (bird != b && d < bird.getPerception()) {
        align.add(b.getVelocity());
        cpt += 1;
      }
    }
    if (cpt > 0) {
      align.div(cpt);
      align.setMag(bird.getMaxSpeed());
      align.sub(bird.getVelocity());
      align.limit(bird.getMaxForce());
    }
    return align;
  }
  
  public PVector cohesion(Bird bird, List<Bird> otherBirds) {
    PVector cohesion = new PVector();
    int cpt = 0;
    for (Bird b : otherBirds) {
      float d = dist(bird.getX(), bird.getY(), b.getX(), b.getY());
      if (bird != b && d < bird.getPerception()) {
        cohesion.add(b.getPosition());
        cpt += 1;
      }
    }
    if (cpt > 0) {
      cohesion.div(cpt);
      cohesion.sub(bird.getPosition());
      cohesion.setMag(bird.getMaxSpeed());
      cohesion.sub(bird.getVelocity());
      cohesion.limit(bird.getMaxForce());
    }
    return cohesion;
  }
  
  public PVector separation(Bird bird, List<Bird> otherBirds) {
    PVector separation = new PVector();
    int cpt = 0;
    for (Bird b : otherBirds) {
      float d = dist(bird.getX(), bird.getY(), b.getX(), b.getY());
      if (bird != b && d < bird.getPerception()) {
        PVector diff = PVector.sub(bird.getPosition(), b.getPosition());
        separation.add(diff);
        cpt += 1;
      }
    }
    if (cpt > 0) {
      separation.div(cpt);
      separation.setMag(bird.getMaxSpeed());
      separation.sub(bird.getVelocity());
      separation.limit(bird.getMaxForce());
    }
    return separation;
  }

}
