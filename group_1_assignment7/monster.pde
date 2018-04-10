class Monster {
  PVector direction;
  float speed,x,y;
  PImage[] sprites= new PImage[4];
  Timer timer;
  int lastTimerIndex;
  int spriteH=128/4, spriteW=32;
  float delay;
 
  
  Monster(){
    speed=.5;
    direction= new PVector(random(-1, 1),random(-1, 1));
    x=width/4;y=350;
    PImage monster= loadImage("monster.png");
    for (int i=0;i<4;i++){
      sprites[i]=monster.get(0,i*spriteH,spriteW,spriteH);
      sprites[i].resize(100,100);
    }
    timer = new Timer(1000,2);
    lastTimerIndex = 0;
    delay=50;
  }
  
  void move(){
    if (y>height-5){
      direction = new PVector(0,-1);
      delay=millis()+1000;
    }
    if (y<205){
      direction = new PVector(0,1);
      delay=millis()+1000;
    }
    if (x>width-5){
      direction = new PVector(-1,0);
      delay=millis()+1000;
    }
    if (x<5){
      direction = new PVector(1,0);
      delay=millis()+1000;
    }
    if (millis()>delay) {
      direction = new PVector(random(-1, 1), random(-1, 1));
      delay=millis()+2500;
    }
    

    
    x+=direction.x;y+=direction.y;
    if (x<1||y<201||x>width-1||y>height-1){
      direction = new PVector(0,0);
      if (x<1){x+=2;}
      if (y<201){y+=2;}
      if (x>width-1){x-=2;}
      if (y>height-1){y-=2;}
      delay=millis();
    }
  }
  
  void display(){
    image(sprites[timer.getIndex()],x-47,y-40);
    strokeWeight(4);
    stroke(255);
    point(x,y);
  }
  
  void play() {
    move();
    display();
  }
}
