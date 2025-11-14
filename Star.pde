class Star //note that this class does NOT extend Floater
{
  private int x, y;
  private int blinkOffset;
  private int blinkDuration;
  
  public Star() {
    x = (int)(Math.random() * (width + 1));
    y = (int)(Math.random() * (height + 1));
    blinkOffset = (int)(Math.random() * 1000);
    blinkDuration = 25000;
  }
  
  public void show() {
    fill(255, 255, 255, Math.abs((millis() / (blinkDuration / 1000) + blinkOffset) % (255 * 2) - 255));
    noStroke();
    ellipse(x, y, 5, 5);
  }
}
