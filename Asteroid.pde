class Asteroid extends Floater {
  public Asteroid() {
    corners = 8;
    xCorners = new int[corners];
    yCorners = new int[corners];
    myColor = color((int)(80 + Math.random() * 20));
    myCenterX = (int)(Math.random() * (width + 1));
    myCenterY = (int)(Math.random() * (height + 1));
    myPointDirection = Math.random() * 360;
    myXspeed = 3 * Math.cos(myPointDirection * PI / 180);
    myYspeed = 3 * Math.sin(myPointDirection * PI / 180);
    for (int i = 0; i < corners; i++) {
      double angle = (double)i / corners * TWO_PI;
      double radius = 10 + Math.random() * 5;
      xCorners[i] = (int)(radius * Math.cos(angle));
      yCorners[i] = (int)(radius * Math.sin(angle));
    }
  }
}
