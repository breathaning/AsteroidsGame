ArrayList<Character> keysDown = new ArrayList();
ArrayList<Character> keysPressed = new ArrayList();

Star[] stars = new Star[100];
ArrayList<Asteroid> asteroids = new ArrayList();
ArrayList<Bullet> bullets = new ArrayList();
Spaceship ship;

public void setup()
{
  size(500, 500);
  ship = new Spaceship();
  for (int i = 0; i < stars.length; i++) {
    stars[i] = new Star();
  }
  for (int i = 0; i < 10; i++) {
    asteroids.add(new Asteroid());
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

  for (int i = 0; i < asteroids.size(); i++) {
    pushMatrix();
    asteroids.get(i).move();
    asteroids.get(i).show();
    popMatrix();
  }

  double forwardDirection = 0;
  if (isKeyDown('w')) forwardDirection += 1;
  //if (isKeyDown('s')) forwardDirection -= 1;
  boolean hyperspace = isKeyPressed(' ');
  if (hyperspace) {
    ship.hyperspace();
  }
  ship.update(forwardDirection);

  boolean shoot = isKeyPressed('m');
  if (shoot) {
    bullets.add(new Bullet(ship));
  }

  pushMatrix();
  ship.show();
  popMatrix();


  for (int i = 0; i < bullets.size(); i++) {
    Bullet bullet = bullets.get(i);
    bullet.move();
    if (bullet.outOfBounds()) {
      bullets.remove(i);
      i--;
      continue;
    }
    bullet.show();
  }

  for (int i = 0; i < asteroids.size(); i++) {
    Asteroid asteroid = asteroids.get(i);

    if (bullets.size() > 0) {
      Bullet closestBullet = bullets.get(0);
      double distanceToClosestBullet = (double)dist((float)asteroid.getX(), (float)asteroid.getY(), (float)closestBullet.getX(), (float)closestBullet.getY());
      for (int j = 1; j < bullets.size(); j++) {
        Bullet bullet = bullets.get(j);
        double distanceToBullet = (double)dist((float)asteroid.getX(), (float)asteroid.getY(), (float)closestBullet.getX(), (float)closestBullet.getY());
        if (distanceToBullet < distanceToClosestBullet) {
          closestBullet = bullet;
          distanceToClosestBullet = distanceToBullet;
        }
      }
      if (distanceToClosestBullet < 20) {
        bullets.remove(closestBullet);
        asteroid.resetPosition();
        i--;
        continue;
      }
    }
    
    double distanceToShip = (double)dist((float)asteroid.getX(), (float)asteroid.getY(), (float)ship.getX(), (float)ship.getY());
    if (distanceToShip < 30) {
      asteroid.resetPosition();
      i--;
      continue;
    }
  }

  keysPressed.clear();
}

void mousePressed() {
  pressKey('m');
}

void mouseReleased() {
  releaseKey('m');
}

void keyPressed() {
  pressKey(key);
}

void keyReleased() {
  releaseKey(key);
}

void pressKey(Character keyChar) {
  if (isKeyDown(keyChar)) return;
  keysDown.add((Character)keyChar);
  keysPressed.add((Character)keyChar);
}

void releaseKey(Character keyChar) {
  keysDown.remove((Character)keyChar);
}

boolean isKeyPressed(Character keyChar) {
  return keysPressed.indexOf(keyChar) != -1;
}

boolean isKeyDown(Character keyChar) {
  return keysDown.indexOf(keyChar) != -1;
}
