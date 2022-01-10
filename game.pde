/*1. Make a new project 
 2. Add the mode framework ^
 3. Add gif and Button classes ^ 
 4. Create a intro with gif and the button ^
 5. do color schemes but idgaf ab that^
 6. Draw "the room" but just walls and floor for now^
 7. Create a GameObject class ^
 8. Create a Hero class that extends GameObject  - moves with keyboard ^
 - runs into walls^
 */
ArrayList<object> myObjects;
ArrayList<darkM> dark;

//GIF
AGIF introGIF;
AGIF manUp;
AGIF manDown;
AGIF manRight;
AGIF manLeft;
AGIF manStand;

AGIF lurkerUp;
AGIF lurkerDown;
AGIF lurkerRight;
AGIF lurkerLeft;
//button
Button introButton;
Button hpButton;
Button sdButton;
//hero

hero myHero;
healer myHealer;

//enemy
Follower myFollower;

//mouseFuntions
boolean mReleased, mPressed, clicked;
//keyboardFuntions
boolean wKey, aKey, sKey, dKey, spaceKey;

//


//colours
color green = #4BFF05;
color blue = #059DFF;
color purple = #69008e;
color yellow = #F6FF0D;
color white = #FFFFFF;
color black = #000000;
color red = #FF190D;
color orange = #FF920D;
color pink = #F7C2D6;
color brown = #602B2B;
//setup gamescreens
int mode = 0;
final int intro = 1;
final int gmode = 2;
final int pause = 3;
final int egame = 4;
final int wgame = 5;


//everything
PFont font;

int s= 100;
int mapx, mapy;
//map
PImage map;
color nR, sR, eR, wR;

final int AMMO = 1;
final int GUN = 2;
final int  HEALTH = 3;

final int ShotgunD = 1;
final int ShotgunBS = 90;
final int ShotgunThres= 5;
final int Follower_HP = 100;
final int FollowerS= 70;

PImage heart;
PImage shotgun;
PImage lasergun;
PImage chest;
PImage chestOpen;
PImage dragon;
PImage fire;


void setup() {
  //setup
  fullScreen();
  mode = intro;
  font = createFont("Bahisy.ttf", 200);
  textFont(font);
  map = loadImage("map.png");


  //objects
  imageMode(CENTER);

  myObjects = new ArrayList<object>(1000);

  //darkness
  dark = new ArrayList<darkM>(1000);
  float s = 50;
  int x = 0, y = 0;



  while ( y< height+s) { 
    dark.add(new darkM(x, y, s));
    x += s;
    if (x >= width) {
      
      x = 0;
      y += s;
    }
  }


  //GIF
  introGIF = new AGIF(35, "frame_", "_delay-0.03s.gif", 0, 0 );
  manUp = new AGIF(3, "forward", ".png", 0, 0);
  manDown = new AGIF(3, "back", ".png", 0, 0);
  manRight = new AGIF(3, "right", ".png", 0, 0);
  manLeft = new AGIF(3, "left", ".png", 0, 0);
  manStand = new AGIF(3, "stand", ".png", 0, 0);

  lurkerUp = new AGIF(3, "lurkerUp", ".png", 0, 0);
  lurkerDown = new AGIF(3, "lurkerDown", ".png", 0, 0);
  lurkerRight = new AGIF(3, "lurkerRight", ".png", 0, 0);
  lurkerLeft = new AGIF(3, "lurkerLeft", ".png", 0, 0);

  //buttons
  introButton = new Button("START", 400, 400, 200, 150, green, yellow);

  sdButton = new Button("Speed+", 100, 300, 50, 50, green, yellow);
  //hero

  myHero = new hero();
  myObjects.add(myHero);
  myHealer = new healer(x,y);
  myObjects.add(myHealer);




  heart = loadImage("heart.png");
  heart.resize(25, 25);
  shotgun = loadImage("shotgun.png");
  shotgun.resize(50, 25);
  lasergun = loadImage("lasergun.png");
  lasergun.resize(50, 25);
  chest = loadImage("Chest.png");
  chest.resize(100, 100);
  chestOpen = loadImage("ChestOpen.png");
  chestOpen.resize(100, 100);
  dragon = loadImage("dragon.png");
  dragon.resize(300,300);
  fire = loadImage("fire.png");
  fire.resize(50,50);
  
  x = 0;
  y = 0;
  
  while (y < map.height) {
    color roomColor = map.get(x, y);
    if (roomColor == orange) {
      
      myObjects.add(new Follower(x, y));
    }
    if (roomColor == blue) {
      myObjects.add(new fakechest(x, y));
    }
    if (roomColor == orange) {
    
      myObjects.add(new Follower(x, y));
    }
    if (roomColor == green) {

      myObjects.add(new Lurker(x, y));
      myObjects.add(new Lurker(x, y));
      myObjects.add(new Lurker(x, y));
      myObjects.add(new Lurker(x, y));
    }
    if (roomColor == yellow) {
      myObjects.add(new Turret(x, y));
    }
    if (roomColor == pink) {
      myObjects.add(new chest(x, y));
    }
     if (roomColor == red) {
      myObjects.add(new BigBoss(x, y));
    }
    x++;
    if (x == map.width) {
      x = 0;
      y++;
    }
  }
}



void draw () {

  clicked();

  if (mode == intro) {
    intro();
  } else if ( mode == gmode ) {
    gmode();
  } else if ( mode == pause ) {
    pause();
  } else if ( mode == egame) {
    egame();
  }else if ( mode == wgame) {
    wgame();
  } 
  else {
    println("Error: Mode = " + mode);
  }
}

void clicked() {
  mReleased = false;
  if (mousePressed) mPressed = true;
  if (mPressed && !mousePressed) {
    mReleased = true;
    mPressed = false;
  }
}

void keyPressed () {

  if (keyCode =='w'||keyCode=='W') {
    wKey=true;
  }
  if (keyCode =='a'||keyCode=='A') {
    aKey=true;
  }
  if (keyCode =='s'||keyCode=='S') {
    sKey=true;
  }
  if (keyCode =='d'||keyCode=='D') {
    dKey=true;
  }
  if (key ==' ') {
    spaceKey = true;
  }


  if (mode==gmode) {
    if (keyCode =='p'||keyCode=='P') {
      mode=pause;
    }
  } else if (mode==pause) {
    if (key=='p'||key=='P') {
      mode=gmode;
    }
  }
}
void keyReleased() {
  if (keyCode =='w'||keyCode=='W') {
    wKey=false;
  }
  if (keyCode =='a'||keyCode=='A') {
    aKey=false;
  }
  if (keyCode =='s'||keyCode=='S') {
    sKey=false;
  }
  if (keyCode =='d'||keyCode=='D') {
    dKey=false;
  }
  if (key ==' ') {
    spaceKey = false;
  }
}
void mouseReleased() {
   if(mode == wgame) {
  
    wgameClicks();
  
  } else if ( mode == egame){
    egameClicks();
  }
  
}
