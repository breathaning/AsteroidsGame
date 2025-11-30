class Asteroid extends Floater {
  private double rotationSpeed;

  public Asteroid() {
    resetPosition();
    corners = 8;
    xCorners = new int[corners];
    yCorners = new int[corners];
    myColor = color((int)(80 + Math.random() * 20));
    myPointDirection = Math.random() * 360;
    myXspeed = 3 * Math.cos(myPointDirection * PI / 180);
    myYspeed = 3 * Math.sin(myPointDirection * PI / 180);
    rotationSpeed = 5 + Math.random() * 5;
    if (Math.random() < 0.5) rotationSpeed *= -1;
    for (int i = 0; i < corners; i++) {
      double angle = (double)i / corners * TWO_PI;
      double radius = 12 + Math.random() * 8;
      xCorners[i] = (int)(radius * Math.cos(angle));
      yCorners[i] = (int)(radius * Math.sin(angle));
    }
  }

  public void move() {
    myPointDirection += rotationSpeed;
    super.move();
  }

  public void resetPosition() {
    myCenterX = (int)(Math.random() * (width + 1));
    myCenterY = (int)(Math.random() * (height + 1));
  }
  
  public double getX() {
    return myCenterX;
  }

  public double getY() {
    return myCenterY;
  } 
}
