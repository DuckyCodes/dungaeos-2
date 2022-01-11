class Bullet extends object {

  float speed;
  int s;
  color colour;
  float d;
  Bullet() {
    loc = new PVector(myHero.loc.x, myHero.loc.y);
    vel = new PVector(0, 0);
    speed = 10;
    vel.setMag(speed);
    hp = 1;
    s = 100;
    colour = pink;
  }

  Bullet(PVector mouseaim, color ncolor, int nsize, float nspeed) {
    loc = new PVector(myHero.loc.x, myHero.loc.y);
    vel = mouseaim;
    speed = nspeed;
    vel.setMag(speed);
    hp = 1;
    s = nsize;
    colour = ncolor;
    roomX = myHero.roomX;
    roomY = myHero.roomY;
    
  }
  
  Bullet(PVector mouseaim, color ncolor, int nsize, float nspeed, float damage){
    loc = new PVector(myHero.loc.x, myHero.loc.y);
    vel = mouseaim;
    speed = nspeed;
    vel.setMag(speed);
    hp = 1;
    s = nsize;
    colour = ncolor;
    roomX = myHero.roomX;
    roomY = myHero.roomY;
    d = damage;
    
    
  }

  void show() {
    stroke(colour);
    fill(colour);
    ellipse(loc.x, loc.y, s, s);
  }
  
  void act() { 
    loc.add(vel);
    if (loc.x < width*0.1 || loc.x > width*0.9 || loc.y < height*0.1 || loc.y > height*0.9) {
      hp = 0;
      int num = 50;
      int n = 0;
      while (n < num) {
        myObjects.add(new Particles(int(random(0, 10)), loc.x, loc.y, colour));
        n++;
      }
    }
  }
}

class BulletTurret extends object {
  
  color colour;
  int damage;
  boolean enemyBullets;

 BulletTurret() {
    loc = new PVector(loc.x, loc.y);
    vel = new PVector(myHero.loc.x, myHero.loc.y);
    sd = 10;
    vel.setMag(sd);
    hp = 100;
    s = 5;
    colour = pink;
    enemyBullets = false;
  }

  BulletTurret(PVector aimHero, color newcolor, int newsize, float newspeed, float x, float y) {
    loc = new PVector(x, y);
    vel = aimHero;
    sd = newspeed;
    vel.setMag(sd);
    hp = 100;
    s = newsize;
    colour = newcolor;
    roomX = myHero.roomX;
    roomY = myHero.roomY;
    enemyBullets = false;
  }

  void show() {
    stroke(colour);
    fill(colour);
    ellipse(loc.x, loc.y, s, s);
  }
  void act() { 
    loc.add(vel);
    if (loc.x < width*0.1 || loc.x > width*0.9 || loc.y < height*0.1 || loc.y > height*0.9) {
      int num = 50;
      int n = 0;
      hp = 0;
      while (n < num) {
        myObjects.add(new Particles(int(random(0, 10)), loc.x, loc.y, colour));
        n++;
      }
    }
  }
}
class ChestTurret extends object {
  
  color colour;
  int damage;
  boolean enemyBullets;

 ChestTurret() {
    loc = new PVector(loc.x, loc.y);
    vel = new PVector(myHero.loc.x, myHero.loc.y);
    sd = 10;
    vel.setMag(sd);
    hp = 100;
    s = 5;
    colour = pink;
    enemyBullets = false;
  }

  ChestTurret(PVector aimHero, color newcolor, int newsize, float newspeed, float x, float y) {
    loc = new PVector(x, y);
    vel = aimHero;
    sd = newspeed;
    vel.setMag(sd);
    hp = 100;
    s = newsize;
    colour = newcolor;
    roomX = myHero.roomX;
    roomY = myHero.roomY;
    enemyBullets = false;
  }

  void show() {
    stroke(colour);
    fill(colour);
    ellipse(loc.x, loc.y, s, s);
  }
  void act() { 
    loc.add(vel);
    if (loc.x < width*0.1 || loc.x > width*0.9 || loc.y < height*0.1 || loc.y > height*0.9) {
      int num = 50;
      int n = 0;
      hp = 0;
      while (n < num) {
        myObjects.add(new Particles(int(random(0, 10)), loc.x, loc.y, colour));
        n++;
      }
    }
  }
}

class BossTurret extends object {
  
  color colour;
  int damage;
  boolean BossBullets;

 BossTurret() {
    loc = new PVector(loc.x, loc.y);
    vel = new PVector(myHero.loc.x, myHero.loc.y);
    sd = 10;
    vel.setMag(sd);
    hp = 100;
    s = 50;
    colour = red;
    BossBullets = false;
  }

  BossTurret(PVector aimHero, color newcolor, int newsize, float newspeed, float x, float y) {
    loc = new PVector(x, y);
    vel = aimHero;
    sd = newspeed;
    vel.setMag(sd);
    hp = 100;
    s = newsize;
    colour = newcolor;
    roomX = myHero.roomX;
    roomY = myHero.roomY;
    BossBullets = false;
  }

  void show() {
    image(fire, loc.x, loc.y);
  }
  void act() { 
    loc.add(vel);
    if (loc.x < width*0.1 || loc.x > width*0.9 || loc.y < height*0.1 || loc.y > height*0.9) {
      int num = 50;
      int n = 0;
      hp = 0;
      while (n < num) {
        myObjects.add(new Particles(int(random(0, 10)), loc.x, loc.y, colour));
        n++;
      }
    }
  }
}
