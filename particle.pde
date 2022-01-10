class Particles extends object {
  int t; 
  color colour;
  int s;
  
  Particles(int _s, float x, float y, color c) {
    hp = 1;
    s = _s;
    colour = c;
    t = int(random(180,255));
    loc = new PVector (x, y);
    vel = new PVector (0,1);
    vel.rotate(random(-PI, PI));
    vel.setMag(random(-2,2));
  }
  
  void show() {
    stroke(colour, t);
    noFill();
    circle(loc.x, loc.y, s);
  }
  
  void act() {
    super.act();
      
    t -= 10;
    if (t <= 0) hp = 0;
  }
}
