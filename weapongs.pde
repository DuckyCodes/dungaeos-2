class weapon {
  int sTimer;
  int threshold;
  int bSpeed; //speed of projectile

 
  weapon() {
    sTimer=0;
    threshold=30;
    bSpeed=5;
  }
  weapon(int t, int s) {
    sTimer = 0;
    threshold = t;
    bSpeed = s;
  }
  void update() {

    sTimer++;
  }

  void shoot() {
    
    if (sTimer>= threshold) {
      PVector aimVector = new PVector(mouseX-myHero.loc.x, mouseY-myHero.loc.y);
      aimVector.setMag(bSpeed);
      myObjects.add(new Bullet(aimVector, pink, 10, 10,10)); 
      sTimer = 0;
    }
  }
}
