class Message extends object {

  int time;
  String text;

  Message(String _text,float x, float y, int rx, int ry) {
    hp = 1;
    time = 250;
    text = _text;
    loc = new PVector(x, y);
    roomX = rx;
    roomY = ry;
  }

  void show() {
    fill(white);
    textSize(30);
    text("+1", loc.x, loc.y);
  }


  void act() {
    super.act();
    time = time - 7;
    if (time <= 0) hp = 0;
    loc.y = loc.y + 0.75;
  }
}
