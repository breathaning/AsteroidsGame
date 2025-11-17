ArrayList<Character> keysDown = new ArrayList();
ArrayList<Character> keysPressed = new ArrayList();

Star[] stars = new Star[100];
Asteroid[] asteroids = new Asteroid[5];
Spaceship ship;

public void setup() 
{
  size(500, 500);
  ship = new Spaceship();
  for (int i = 0; i < stars.length; i++) {
    stars[i] = new Star();
  }
  for (int i = 0; i < asteroids.length; i++) {
    asteroids[i] = new Asteroid();
  }
}
public void draw() 
{
  background(0, 0, 0);
  
  for (int i = 0; i < stars.length; i++) {
    pushMatrix();
    stars[i].show();
    popMatrix();
  }
  
  for (int i = 0; i < asteroids.length; i++) {
    pushMatrix();
    asteroids[i].update();
    asteroids[i].move();
    asteroids[i].show();
    popMatrix();
  }

  double forwardDirection = 0;
  if (keysDown.indexOf((Character)('w')) != -1) forwardDirection += 1;
  if (keysDown.indexOf((Character)('s')) != -1) forwardDirection -= 1;
  boolean hyperspace = (keysPressed.indexOf((Character)(' ')) != -1);
  if (hyperspace) {
    ship.hyperspace();
  }
  ship.update(forwardDirection);

  pushMatrix();
  ship.show();
  popMatrix();

  keysPressed.clear();
}

void keyPressed() {
  if (keysDown.indexOf((Character)key) != -1) return;
  keysDown.add((Character)key);
  keysPressed.add((Character)key);
}

void keyReleased() {
  keysDown.remove((Character)key);
}
