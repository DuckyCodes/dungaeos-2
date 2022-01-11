class darkM {
  float t;
  float x, y, s;
  float d;

  darkM(float _x, float _y, float _s) {
    s = _s;
    x = _x;
    y = _y;
    t= 0;
  }
  void show() {
     d = dist(myHero.loc.x, myHero.loc.y, x, y );
    t= map (d, 0, 300, 0, 255);
    fill(black, t);
    noStroke();
    square(x, y, s);
   
    
  }
  void act(){
    
  }
}
