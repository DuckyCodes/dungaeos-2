class object {
  int roomX, roomY;
  PVector loc;
  PVector vel;
  int damage;
  color c;
  float hp;
  int hpMax;
  int xp;
  float sd;
  int s;
  int enemyK;


  object() {
    loc = new PVector(width/2, height/2);
    vel = new PVector(0, 0);
    hp = 1;
  }
  void show() {
  }
  void act() {

    loc.add(vel);

    if (loc.x<width*0.1) loc.x=width*0.1;
    if (loc.y<height*0.1) loc.y=height*0.1;

    if (loc.x>width*0.9) loc.x=width*0.9;
    if (loc.y>height*0.9) loc.y=height*0.9;
  }

  boolean Collidingwith(object myObj) {

    float d = dist(loc.x, loc.y, myObj.loc.x, myObj.loc.y);

    return(roomwith(myObj) && d < s/2 + myObj.s/2 && hp>0);
  }
  boolean roomwith(object myObj) {
    return(roomX == myObj.roomX && roomY == myObj.roomY);
  }
  void explode(int s, int n, int c) {
    int i = 0;
    while (i < n) {
      myObjects.add(new Particles(s/4, loc.x, loc.y, c));
      i++;
    }
  }
}
