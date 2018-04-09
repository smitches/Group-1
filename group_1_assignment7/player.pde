class Player{
  PVector direction; 
  float speed,x,y;
  PImage[] sprites= new PImage[4];
  ArrayList<PVector> vertexs = new ArrayList<PVector>();
  ArrayList<PVector> corners = new ArrayList<PVector>();
  ArrayList<PShape> area = new ArrayList<PShape>();
  Timer timer;
  Boolean alive=true;
  int spriteH=128/4, spriteW=32;
  Player(){
    speed=.5;
    direction= new PVector(0,0);
    PVector ULC = new PVector(1.0,200.0);
    PVector URC = new PVector(649.0,201.0);
    PVector LLC = new PVector(1.0,649.0);
    PVector LRC = new PVector(649.0,649.0);
    corners.add(ULC);
    corners.add(URC);
    corners.add(LLC);
    corners.add(LRC);
    x=width/2;y=200;
    fill(0);
    timer = new Timer(55, 4);
    PImage kritter=loadImage("kritter.png");
    for (int i=0; i<4; i++){
      sprites[i]=kritter.get(0,i*spriteH, spriteW,spriteH);
      sprites[i].resize(100,100);
    }
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
      fillArea(vertexs);
    }
    if (screen.pixels[int(x+(y-200)*width)]==background){
      screen.loadPixels();
      screen.pixels[int(x+(y-200)*width)]=web;
      screen.updatePixels();
    }
  }
  void display(Boolean b){
    image(screen,0,200);
    if(b){image(sprites[timer.getIndex()],x-48,y-40);}
    else{image(screen,0,200);}
    for (int j=0; j < area.size(); j++){
      shape(area.get(j),0,0);
    }
  }
  void play(Boolean b){
    move();
    display(b);
  }
  void fillArea(ArrayList<PVector> arrlist){
  noStroke();
  fill(204, 102, 0);
  PVector lastTurn;
  lastTurn = new PVector(x,y);
  vertexs.add(lastTurn);
  PShape web;
  web = createShape();
  web.beginShape();
  for (int i=0; i < arrlist.size(); i++){
    web.vertex(arrlist.get(i).x , arrlist.get(i).y);
  }
  web.endShape(CLOSE);
  area.add(web);
  arrlist.clear();
  justClosed=true;
  }
  void checkDie(Monster m){
    if (screen.pixels[int(x+(y-200)*width)]==web){
      alive=false;
    }
    if (screen.pixels[int(m.x+(m.y-200)*width)]==web){
      alive=false;
    }
    if (dist(m.x,m.y,x,y)<50){
      alive=false;
    }
    if (alive==false){
      println("dead");
    }
    
  }
  void changeDirection(){
    PVector turn;
    turn = new PVector(x,y);
    vertexs.add(turn);
    
    if (keyCode==UP){ 
        direction=new PVector(0,-1);
    }
    if (keyCode==DOWN){
      direction=new PVector(0,1);
    }
    if (keyCode==LEFT){
      direction=new PVector(-1,0);
    }
    if (keyCode==RIGHT){
      direction=new PVector(1,0);
    }
  }
  //int findSides(PVector v1, PVector v2){
    //int side1, side2;
      
  //}
    
}
