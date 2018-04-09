class Monster {
  PVector direction;
  float speed,x,y;
  PShape body;
  Timer timer;
  int lastTimerIndex;
  
  Monster(){
    speed=.5;
    direction= new PVector(random(-1, 1),random(-1, 1));
    x=width/4;y=350;
    fill(0,0,255);
    body = createShape(RECT,0,0,50,50);
    timer = new Timer(1000, 2);
    lastTimerIndex = 0;
  }
  
  void move(){
    if (timer.getIndex() != lastTimerIndex) {
      direction = new PVector(random(-1, 1), random(-1, 1));
      lastTimerIndex = timer.getIndex();
    }
    
    x+=direction.x;y+=direction.y;
    if (x<0||y<200||x>width-50||y>height-50){
      direction = new PVector(0,0);
      if (x<0){x+=2;}
      if (y<200){y+=2;}
      if (x>width-50){x-=2;}
      if (y>height-50){y-=2;}
    }
  }
  
  void display(){
    
    shape(body,x,y);
  }
  
  void play() {
    move();
    display();
  }
}