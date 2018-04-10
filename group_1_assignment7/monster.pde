class Monster {
  PVector direction;
  float speed,x,y;
  PImage[] sprites= new PImage[4];
  Timer timer;
  int lastTimerIndex;
  int spriteH=128/4, spriteW=32;
 
  
  Monster(){
    speed=.5;
    direction= new PVector(random(-2, 2),random(-2, 2));
    x=width/4;y=350;
    PImage monster= loadImage("monster.png");
    for (int i=0;i<4;i++){
      sprites[i]=monster.get(0,i*spriteH,spriteW,spriteH);
      sprites[i].resize(100,100);
    }
    timer = new Timer(1000,2);
    lastTimerIndex = 0;
  }
  
  void move(){
    if (screen.pixels[int(x+(y-200)*width)]==territory){
      direction = new PVector(-1*direction.x, direction.y);
      //lastTimerIndex = timer.getIndex();
    }
    if (timer.getIndex() != lastTimerIndex) {
      direction = new PVector(random(-1, 1), random(-1, 1));
      lastTimerIndex = timer.getIndex();
    }
    
    x+=direction.x;y+=direction.y;
    if (x<0||y<200||x>width-1||y>height-1){
      direction = new PVector(0,0);
      if (x<0){x+=2;}
      if (y<200){y+=2;}
      if (x>width-1){x-=2;}
      if (y>height-1){y-=2;}
    }
  }
  
  void display(){
    image(sprites[timer.getIndex()],x-47,y-40);
  }
  
  void play() {
    move();
    display();
  }
}