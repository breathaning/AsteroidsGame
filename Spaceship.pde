class Spaceship extends Floater  
{
  public Spaceship() {
    corners = 4;
    xCorners = new int[]{16, -8, -2, -8};
    yCorners = new int[]{0, -8, 0, 8};
    myColor = color(255, 0, 0);
    myCenterX = width / 2;
    myCenterY = height / 2;
    myXspeed = 0;
    myYspeed = 0;
    myPointDirection = 0;
  }

  public void hyperspace() {
    myCenterX = Math.random() * (width + 1);
    myCenterY = Math.random() * (height + 1);
    myPointDirection = Math.random() * 360;
    myXspeed = 0;
    myYspeed = 0;
  }

  public void update(double forwardDirection) {
    double wantedDirection = normalizeRadians(Math.atan2(mouseY - myCenterY, mouseX - myCenterX));
    double currentDirection = normalizeRadians(toRadians(myPointDirection));
    double difference = normalize(wantedDirection - currentDirection, TWO_PI, PI);
    myPointDirection = toDegrees(wantedDirection - difference);
    turn(toDegrees(difference * 0.1));

    double forward = 0.5 * forwardDirection;
    accelerate(forward);
    myXspeed *= 0.9;
    myYspeed *= 0.9;
    move();
  }

  private double normalizeRadians(double angle) {
    return normalize(angle, TWO_PI, 0);
  }

  private double normalize(double n, double range, double offset) {
    return (n % range + range + offset) % range - offset;
  }

  private double toDegrees(double angle) {
    return angle * 180 / PI;
  }

  private double toRadians(double angle) {
    return angle * PI / 180;
  }
  
  public double getX() {
    return myCenterX;
  }
  
  public double getY() {
    return myCenterY;
  }
}
