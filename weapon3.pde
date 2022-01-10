class Shotgun extends weapon {
  Shotgun() {
    super(ShotgunBS, ShotgunThres);
  }
  void shoot() {
    if (sTimer >= threshold) {
      for (int i = 0; i < 30; i++) {
        PVector aimVector = new PVector(mouseX-myHero.loc.x, mouseY-myHero.loc.y);
        aimVector.rotate(random(0.35));
        aimVector.setMag(bSpeed/2);
        
         myHero.vel.sub(aimVector);
        myObjects.add(new Bullet(aimVector, pink, 10, 10, 1));
        sTimer = 0;
      }
    }
  }
}
class laserGun extends weapon {
  laserGun() {
    super(1, 1);
    
  }
  void shoot() {
    if (sTimer>= threshold) {
      PVector aimVector = new PVector(mouseX-myHero.loc.x, mouseY-myHero.loc.y);
      
      aimVector.setMag(bSpeed);
       myHero.vel.sub(aimVector);
      myObjects.add(new Bullet(aimVector, pink, 10, 10, 1));
      
      sTimer = 0;
    }
  }
  
}
class DefaultGun extends weapon {
  DefaultGun() {
    super(50, 100);
    
  }
  
}
