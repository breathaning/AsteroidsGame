class Bullet extends Floater {
    public Bullet(Spaceship ship) {
        myCenterX = ship.getX();
        myCenterY = ship.getY();
        myPointDirection = ship.getDirection();
        myXspeed = 0;
        myYspeed = 0;

        accelerate(8.0);
    }

    public void show() {
        noStroke();
        fill(0, 0, 255);
        ellipse((float)myCenterX, (float)myCenterY, 10, 10);
    }

    public boolean outOfBounds() {
        return (myCenterX <= 0 || myCenterX >= width) || (myCenterY <= 0 || myCenterY >= height);
    }

    public double getX() {
        return myCenterX;
    }

    public double getY() {
        return myCenterY;
    }
}