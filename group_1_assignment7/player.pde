class Player{
  PVector direction;
  float speed,x,y;
  PShape body;
  int curx, cury;
  ArrayList<PVector> vertex = new ArrayList<PVector>();
  Timer timer;
  Player(){
    speed=.5;
    direction= new PVector(0,0);
    x=width/2;y=200;
    fill(0);
    body= createShape(RECT,0,0,50,50);
    //timer = new Timer(15, pshapearray.length); FOR ANIMATION
    for (int i=0; i<screen.width*screen.height;i++){
      screen.pixels[i]=background;
    }
  }
  void move(){
    x+=direction.x;y+=direction.y;
    if (x<0||y<200||x>width-50||y>height-50){
      direction = new PVector(0,0);
      if (x<0){x+=2;}
      if (y<200){y+=2;}
      if (x>width-50){x-=2;}
      if (y>height-50){y-=2;}
    }
    if (screen.pixels[int(x+(y-200)*width)]==background){
      screen.loadPixels();
      screen.pixels[int(x+(y-200)*width)]=web;
      screen.updatePixels();
    }
  }
  void display(){
    image(screen,0,200);
    fill(0);
    shape(body,x,y);
    //do animations here
    
  }
  void play(){
    move();display();
  }
  void fillArea(){
  
    
    
  }
  void changeDirection(){
    float upperX, upperY, lowerX, lowerY;
    if (keyCode==UP){
      PVector turn;
      turn = new PVector(x,y);
      vertex.add(turn);
      direction=new PVector(0,-1);
      
    }
    if (keyCode==DOWN){
      PVector turn;
      turn = new PVector(x,y);
      vertex.add(turn);
      direction=new PVector(0,1);
      
    }
    if (keyCode==LEFT){
      PVector turn;
      turn = new PVector(x,y);
      vertex.add(turn);
      direction=new PVector(-1,0);
    }
    if (keyCode==RIGHT){
      PVector turn;
      turn = new PVector(x,y);
      vertex.add(turn);
      direction=new PVector(1,0);
    }
  }
}