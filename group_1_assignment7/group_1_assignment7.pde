Player p;
Monster m;

CircleButton cb;
color background= color(50,50,50), web=color(00), territory=color(0);
PImage screen;
Boolean justClosed=false;

void setup(){size(700,700);  cb= new CircleButton(20,20,30); 
  screen= loadImage("screen1.png").get(00,200,700,500);
  p=new Player();
  m=new Monster();
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
  
  text("percentage: "+str(filled)+"/"+str(total),50,50);
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
  }
}
