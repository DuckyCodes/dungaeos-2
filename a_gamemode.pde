void gmode() {


  image(map, 100, 100);
  gameRoom();
  GameObjects();
  
  darkness();
  map();

}

void GameObjects() {

  for ( int i =0;  i < myObjects.size(); i++) {
    object myObj = myObjects.get(i);
    if (myObj.roomX == myHero.roomX && myObj.roomY == myHero.roomY) {
      myObj.show();
      myObj.act();

      if (myObj.hp <= 0) {
        myObjects.remove(i);
        i--;
      }
      
    }
  }
}

void darkness() {
  int i = 0;
  while ( i < dark.size()) {
    darkM myDark = dark.get(i);
    myDark.show();
    myDark.act();


    i++;
  }
}

void map() {

  int i = 0;
  int mapx = 0;
  int mapy = 0;
  while (i <169) {

    if (map.get(mapx, mapy)== white) {
      
      fill(white);
    }
    if (map.get(mapx, mapy) == black) {
      stroke(white);
      fill(black);
    }
    if (map.get(mapx, mapy)== yellow) {
      
      fill(yellow);
    }
    if (map.get(mapx, mapy)== pink) {
      
      fill(pink);
    }
    if (map.get(mapx, mapy)== purple) {
      
      fill(purple);
    }
    if (map.get(mapx, mapy)== blue) {
      
      fill(blue);
    }
    if (map.get(mapx, mapy) == green) {
      stroke(white);
      fill(green);
    }
     if (map.get(mapx, mapy) == red) {
      stroke(white);
      fill(red);
    }
    if (map.get(mapx, mapy) == orange) {
      stroke(white);
      fill(orange);
    }
    if (myHero.roomX == mapx && myHero.roomY == mapy) {
      fill(brown);
    }
    rect(mapx*12+50, mapy*12+50, 12, 12 );
    mapx++;
    i++;

    if (mapx >= 13) {
      mapx = 0;
      mapy++;
    }
  }
}

void gameRoom(){
  //room
   background(brown);
  stroke(black);
  strokeWeight(4);
  line( 0,0,width, height);
  line( width, 0,0,height);
 
 
  //exit
  nR = map.get(myHero.roomX, myHero.roomY-1);
  sR = map.get(myHero.roomX, myHero.roomY+1);
  wR = map.get(myHero.roomX-1, myHero.roomY);
  eR = map.get(myHero.roomX+1, myHero.roomY);
  
  //doorsa
  noStroke();
  fill(black);
  if(nR != white){
    ellipse(width/2, height*0.1,100, 100);
  }
  if(eR !=  white){
    ellipse(width*0.9, height/2,100, 100);
  }
  if(sR !=  white){
    ellipse(width/2, height*0.9,100, 100);
  }
  if(wR !=  white){
    ellipse(width*0.1, height/2,100, 100);
  }
 
  
  
 //floor\

 rectMode(CENTER);
  fill(brown);
  stroke(black);
  rect(width/2,height/2,width*0.8,height*0.8);
}
