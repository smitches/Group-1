Player p;
Monster m;


boolean rect = true; 
boolean circle = true; 

CircleButton cb;
RectButton rb; 

color background= color(50,50,50), web=color(00), territory=color(0);
PImage screen;
Boolean justClosed=false;

void setup(){size(700,700);  //cb= new CircleButton(20,30,40);
  rb = new RectButton(40,30,40,30);
  screen= loadImage("screen1.png").get(00,200,700,500);
  p=new Player();
  m=new Monster();
  fill(255);
  cb = new CircleButton(30, 30, 30, "Play");
  //frameRate(10);
  
  
}
void draw(){
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
  if (cb.inRange()){
    fill(255); 
  }
  
  text("percentage: "+str(filled)+"/"+str(total),50,50);
}

void drawLose(){
  
  fill(0); 
  textSize(40);
  text("LOSE", 20, 60); 

}

void keyPressed(){
  p.changeDirection();
  if (keyCode==ENTER){
    //restart the game
  }
  if (key=='p' || key=='P'){
    //play/pause
  }
}

void mouseClicked(){
  if (cb.inRange()){//do the pause/play
  
    println("PAUSE"); 
  }
  
  if (rb.inRange()){
    println("PLAY"); 
  }
}