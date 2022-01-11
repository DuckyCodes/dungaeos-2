
class chest extends ally {
  int a = 1;
  boolean chesta= true ;
  chest(int x, int y) {
    super(1, 1, x, y);
    s =50;
    hp = 10000;
  }

  void show() {
  }

  void act() {
    super.act();


    if ((dist(myHero.loc.x, myHero.loc.y, loc.x, loc.y) <= 50)) {
      chesta = false;
    }
    if (chesta==true) {
      image(chest, loc.x, loc.y);
    }
    if (chesta == false) {
      image(chestOpen, loc.x, loc.y);
      if (a >0) {
        myObjects.add(new DropItem(loc.x, loc.y, roomX, roomY));
        a--;
      }
    }
  }
}
class dog extends ally {
  int a = 1;
  boolean chesta= true ;
  dog(int x, int y) {
    super(1, 1, x, y);
    s =50;
    hp = 100;
  }

  void show() {
    circle(blue, loc.x, loc.y);
  }

  void act() {
    super.act();


    if ((dist(myHero.loc.x, myHero.loc.y, loc.x, loc.y) <= 50)) {
      chesta = false;
    }
    if (chesta==true) {
      image(chest, loc.x, loc.y);
    }
    if (chesta == false) {
      image(chestOpen, loc.x, loc.y);

      if (a >0) {
        myObjects.add(new DropItem(loc.x, loc.y, roomX, roomY));
        a--;
      }
    }
  }
}
class healer extends ally {
  int a = 1;
  healer(int x, int y) {
    super(100, 10, x, y);
    s = 50;
    hp = 100;
  }

  void show() {
    fill(yellow);
    circle(loc.x, loc.y, s);
  }

  void act() {
    super.act();  


    if (roomX != myHero.roomX || roomY != myHero.roomY) {
      roomX = myHero.roomX;
      roomY = myHero.roomY;
     
    }
   
    vel = new PVector (myHero.loc.x - loc.x, myHero.loc.y - loc.y);
    vel.setMag(2.5);
    if ((dist(myHero.loc.x, myHero.loc.y, loc.x, loc.y) <= 150)) {
      if (myHero.hp <= myHero.hpMax) {
        myHero.hp = myHero.hp + 1;
      }
    }
  }
}
