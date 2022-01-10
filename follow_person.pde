class Follower extends Enemy {

  Follower(int x, int y) {
    super(Follower_HP, FollowerS, x, y);
    s =50;
    xp = 1;
    enemyK= 1;
  }

  void show() {
    fill(orange);
    ellipse(loc.x, loc.y, s, s);
    fill(0);
    textSize(20);
    text(hp, loc.x, loc.y);
  }

  void act() {
    super.act(); 
    vel = new PVector (myHero.loc.x - loc.x, myHero.loc.y - loc.y);
    vel.setMag(2.5);
  }
}


class Lurker extends Enemy {
  Lurker(int x, int y) {
    super(100, 50, x, y);
    s =50;
    currentAction = lurkerDown;
    xp = 1;
    enemyK= 1;
  }
  void show() {
    fill(blue);

    currentAction.show( loc.x, loc.y, s, s);

    fill(0);
    textSize(20);
    text(hp, loc.x, loc.y);
  }
  void act() {
    super.act();

    if (abs(vel.y)>abs(vel.x)) {
      if (vel.y>=0)currentAction = lurkerUp;
      else currentAction = lurkerDown;
    } else {
      if (vel.x>0)currentAction = lurkerRight;
      else currentAction = lurkerLeft;
    }

    if ((dist(myHero.loc.x, myHero.loc.y, loc.x, loc.y) <= 150)) {
      vel = new PVector(myHero.loc.x - loc.x, myHero.loc.y - loc.y);
    } else {
      vel.setMag(0);
    }
    vel.setMag(2.5);
  }
}


class Turret extends Enemy {

  int shotTimer, threshold;

  Turret(int x, int y) {
    super(100, 25, x, y);
    s = 100;
    threshold=shotTimer =50;
    xp = 1;
    enemyK= 1;
  }

  void show() {
    fill(red);
    circle(loc.x, loc.y, s);
    fill(0);
    textSize(20);
    text(hp, loc.x, loc.y);
  }

  void act() {
    super.act();
    shotTimer++;
    if (shotTimer >= threshold) {
      PVector aimVector = new PVector (myHero.loc.x - loc.x, myHero.loc.y - loc.y);
      aimVector.setMag(1);
      myObjects.add(new BulletTurret(aimVector, pink, 10, 20, loc.x, loc.y));
      shotTimer = 1;
    }
  }
}
class fakechest extends Enemy {
  boolean chesta = true;
  int shotTimer, threshold;
  fakechest(int x, int y) {
    super(400, 25, x, y);
    xp = 1;
    enemyK= 1;
  }
  void show () {
    image(chest, loc.x, loc.y);
  }
  void act() {
    super.act(); 

    if ((dist(myHero.loc.x, myHero.loc.y, loc.x, loc.y) <= 50)) {
      chesta = false;
    }
    if (chesta == false) {
      vel = new PVector(myHero.loc.x - loc.x, myHero.loc.y - loc.y);
      if (shotTimer >= threshold) {
        PVector aimVector = new PVector (myHero.loc.x - loc.x, myHero.loc.y - loc.y);
        aimVector.setMag(1);
        myObjects.add(new BulletTurret(aimVector, pink, 10, 20, loc.x, loc.y));
        shotTimer = 10;
      }
    } else {
    }
    vel.setMag(2.5);
  }
}
class BigBoss extends Enemy {
  boolean Boss = true;
  boolean protection = true;
  int shotTimer, threshold;
  BigBoss(int x, int y) {
    super(400, 300, x, y);
  }
  void show () {
    image(dragon,loc.x,loc.y);
  }
  void act() {
    super.act(); 

    if ( myHero.enemyK>=55 ) {
      Boss = false;
      protection = false;
    }
    if (protection == true) {
      fill(black);
      hp = 1000;
    }
    if (Boss == false) {

      vel = new PVector (myHero.loc.x - loc.x, myHero.loc.y - loc.y);
      vel.setMag(5);

      if (shotTimer >= threshold) {
        PVector aimVector = new PVector (myHero.loc.x - loc.x, myHero.loc.y - loc.y);
        aimVector.setMag(1);
        myObjects.add(new BossTurret(aimVector, red, 50, 50, loc.x, loc.y));
        shotTimer = 1;
      }
    } else {
    }
    vel.setMag(2.5);

    if (hp<=0) {
      mode = wgame;
    }
  }
}
