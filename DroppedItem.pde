class DropItem extends object {

  int type;
  int guns;
  weapon w;

  DropItem(float x, float y, int rx, int ry) {
    w = new Shotgun();
    w = new laserGun();

    type = (int)random(2);
    if (type == 1) type = HEALTH;
    if (type == 2) type = GUN;
    {
      guns = (int)random(2);
      if (guns == 0) w = new Shotgun();
      if (guns == 1) w = new laserGun();
    }
    loc= new PVector(x, y);
    vel = new PVector(0, 0);
    s = 20;
    roomX= rx;
    roomY= ry;
  }

  void show() {
    if (type == HEALTH) {

      image(heart, loc.x, loc.y);
    }
    if (type == GUN) {
      if (guns == 0) {
        image(shotgun, loc.x, loc.y);
      }
      if (guns == 1) {
        image(lasergun, loc.x, loc.y);
      }
    }
  }
  void act() {
  }
}
