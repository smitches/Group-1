Player p;
Monster m1, m2;


boolean rect = true; 
boolean circle = true; 

CircleButton cb;
RectButton rb; 

color background= color(50,50,50), web=color(255), territory=color(204, 102, 0);
PImage screen;
Boolean justClosed=false;
Boolean isPlaying = true;

void setup(){size(700,700);  
  textSize(32);
  //cb= new CircleButton(20,30,40);
  rb = new RectButton(173,60,120,50);
  screen= loadImage("screen1.png").get(00,200,700,500);
  p=new Player();
  m1=new Monster();
  //m2=new Monster();
  //fill(255);
  cb = new CircleButton(110, 85, 94);
  //frameRate(5);
  
  
}
void draw(){
  if (isPlaying){
  background(255);
  float filled=0,total=0;
  for (int i=0; i<screen.width*screen.height;i++){
    if (screen.pixels[i]==territory){filled+=1;}
    total+=1;
  }
  cb.display();
  if(justClosed){p.play(false);save("screen1.png");
screen= loadImage("screen1.png").get(0,200,700,500);
justClosed=false;
for(int i=0;i<screen.pixels.length;i++){
  if(screen.pixels[i]==web){screen.pixels[i]=territory;}
}
p.area.clear();
}
  p.play(true);
  m1.play();
  //m2.play();
  rb.display();
  p.checkDie(m1);
  //p.checkDie(m2);
  
  //fill(200,0,0);
  if (cb.inRange() || rb.inRange()){
    fill(255); 
  }
  //fill(238,244,66);
  text("PLAY", 75, 95); 
  fill(244,229,66);
  text("PAUSE", 190, 95);
  
  fill(0);
  float pct = float(round((filled/total)*10000))/100;
  
  println(pct);
  text("You Own: "+pct+"%",width-300,95);
  if (p.checkWin(pct)){
    drawWin();
  }
  //strokeWeight(20);
  }
  else{drawLose();}
}

void drawLose(){
  background(255);
  fill(0); 
  textSize(40);
  text("LOSE", 20, 60); 
  text("Press 'Enter' to Play Again",20,100);

}

void drawWin(){
  background(255);
  fill(0); 
  textSize(40);
  text("Win", 20, 60); 
  text("Press 'Enter' to Restart",20,100);

}

void keyPressed(){
  p.changeDirection();
  if (keyCode==ENTER){
     setup();
     isPlaying=true;
  }
  if (key=='p' || key=='P'){
    //play/pause
  }
}

void mouseClicked(){
  if (cb.inRange()){//do the pause/play
  
    //println("PLAY"); 
    loop();
  }
  
  if (rb.inRange()){
    //println("PAUSE"); 
    noLoop(); 
  }

}
