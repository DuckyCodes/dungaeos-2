void pause() {
  background(brown);
  //upgrades text
  fill(black);
  textSize(100);
  text("upgrades", width/2, height/6);

  textSize(60);
  //textMode(CENTER/2);

  //hp text

  textSize(60);
  fill(black);
  text("max hp: "+myHero.hpMax, width/2.5, height/3);
if (myHero.xp<=0){
 myHero.xp = 0; 
}

  hpButton = new Button("hp+", 100, 200, 50, 50, green, yellow);
  hpButton.show();
  if (myHero.xp >= 1) {
  if (hpButton.clicked) {
    myHero.hp++;
    myHero.hpMax = myHero.hpMax + 1;
    myHero.xp = myHero.xp - 1;
  } else myHero.hpMax = myHero.hpMax;
  }



  //speed text
  textSize(60);
  fill(black);
  text("speed: "+ myHero.sp, width/2.5, height/2);

  sdButton = new Button("Speed+", 100, 300, 50, 50, green, yellow);
  sdButton.show();
  if (myHero.xp >= 1) {
  if (sdButton.clicked) {
    myHero.sp = myHero.sp + 0.25;
    myHero.xp = myHero.xp - 1;
  }else myHero.sp = myHero.sp;
  
  textSize(60);
  text("XP: "+myHero.xp, width/2, height/1.15);
}
}
