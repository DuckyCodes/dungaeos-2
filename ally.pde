class ally extends object{
  float sp;
  AGIF currentAction;

  ally() {
    s = 50;
    loc = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    hp = 100;
    roomX = 0;
    roomY= 0;
    xp =1;
    enemyK=1;
  }
  ally(int _hp, int _s, int x, int y) {
    loc = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    hp = _hp;
    s = _s;
    
    roomX = x;
    roomY = y;
    
  }
  void show() {
    stroke(black);
    fill(green);
    circle(loc.x, loc.y, s);
    fill(black);
    textSize(20);
    text(hp, loc.x, loc.y);
    
  }
  void act() {

    super.act();
    int i = 0 ;
    while (i<myObjects.size()) {

      object obj = myObjects.get(i);
      if (obj instanceof Bullet && Collidingwith(obj) ) {

        hp = hp - int(obj.vel.mag());
        obj.hp = 0;
        if (hp<=0) {
           explode(s, 100, red);
          myObjects.add(new Message("+"+xp,loc.x,loc.y,roomX, roomY));
          myHero.xp =myHero.xp + xp;
          myHero.enemyK =myHero.enemyK + enemyK;
        }
      }

      i++;
    }
  }
}
  
