Player p;
CircleButton cb;
color background= color(200,50,50), web=color(00), territory=color(0);
PImage screen;
void setup(){size(700,700);  cb= new CircleButton(20,20,30); 
  screen= loadImage("screen1.png").get(0,0,700,500);
  p=new Player();
}
void draw(){
  background(255);
  int filled=0,total=0;
  for (int i=0; i<screen.width*screen.height;i++){
    if (screen.pixels[i]==territory){filled+=1;}
    total+=1;
  }
  cb.display();
  p.play();
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
