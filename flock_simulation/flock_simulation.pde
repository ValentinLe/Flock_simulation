
World world;

void setup() {
  size(900, 700);
  world = new World(60, 8);
}

void draw() {
  background(26, 35, 126);
  stroke(255);
  strokeWeight(6);
  for (Bird bird : world.getBirds()) {
    point(bird.getX(), bird.getY());
    bird.update(world);
  }
  
  stroke(255, 0, 0);
  strokeWeight(0);
  fill(244, 67, 54);
  float sizeRect = 15;
  for (Bird bird : world.getAgressiveBirds()) {
    rect(bird.getX()-sizeRect/2, bird.getY()-sizeRect/2, sizeRect, sizeRect);
    bird.update(world);
  }
}
