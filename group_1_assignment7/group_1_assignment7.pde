Player p;
Monster m;


boolean rect = true; 
boolean circle = true; 

CircleButton cb;
RectButton rb; 

color background= color(50,50,50), web=color(00), territory=color(0);
PImage screen;
Boolean justClosed=false;
Boolean isPlaying = true;

void setup(){size(700,700);  
  //cb= new CircleButton(20,30,40);
  rb = new RectButton(140,50,140,50);
  screen= loadImage("screen1.png").get(00,200,700,500);
  p=new Player();
  m=new Monster();
  //fill(255);
  cb = new CircleButton(90, 90, 90);
  //frameRate(10);
  
  
}
void draw(){
  if (isPlaying){
  background(255);
  int filled=0,total=0;
  for (int i=0; i<screen.width*screen.height;i++){
    if (screen.pixels[i]==territory){filled+=1;}
    total+=1;
  }
  cb.display();
  if(justClosed){p.play(false);save("screen1.png");screen= loadImage("screen1.png").get(0,200,700,500);justClosed=false;}
  p.play(true);
  m.play();
  rb.display();
  
  //fill(200,0,0);
  if (cb.inRange() || rb.inRange()){
    fill(255); 
  }
  //fill(238,244,66);
  text("PLAY!", 75, 95); 
  fill(244,229,66);
  text("PAUSE", 190, 70);
  
  fill(0);
  text("percentage: "+str(filled)+"/"+str(total),10,20);
  //strokeWeight(20);
  }
  else{drawLose();}
}

void drawLose(){
  
  fill(0); 
  textSize(40);
  text("LOSE", 20, 60); 
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
