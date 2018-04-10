class Player{
  PVector direction, sides; 
  float speed,x,y;
  int side1, side2;
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
    PVector URC = new PVector(699.0,201.0);
    PVector LLC = new PVector(1.0,699.0);
    PVector LRC = new PVector(699.0,699.0);
    corners.add(ULC);
    corners.add(URC);
    corners.add(LRC);
    corners.add(LLC);
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
    if (outBounds()){
      direction = new PVector(0,0);
      if (x<1){x+=2;}
      if (y<201){y+=2;}
      if (x>width-1){x-=2;}
      if (y>height-1){y-=2;}
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
  fill(territory);
  PVector lastTurn, twoSides, extra1;
  lastTurn = new PVector(x,y);
  vertexs.add(lastTurn);
  PVector first = arrlist.get(0);
  PVector last = arrlist.get(arrlist.size()-1);
  twoSides = findSides(first, last);
  if (abs(twoSides.x-twoSides.y) != 2) {
    if (twoSides.x == 0){
      extra1 = new PVector(last.x, first.y);
      arrlist.add(extra1);
    }else if (twoSides.x == 1){
      extra1 = new PVector(first.x, last.y);
      arrlist.add(extra1);
    }else if (twoSides.x == 2){
      extra1 = new PVector(last.x, first.y);
      arrlist.add(extra1);
    }else if (twoSides.x == 3){
      extra1 = new PVector(first.x, last.y);
      arrlist.add(extra1);
    }
  }else {
    if (twoSides.x == 0){
      arrlist.add(corners.get(2));
      arrlist.add(corners.get(1));
    }else if (twoSides.x == 2){
      arrlist.add(corners.get(1));
      arrlist.add(corners.get(2));
    }else if (twoSides.x == 1){
      arrlist.add(corners.get(0));
      arrlist.add(corners.get(1));
    }else if (twoSides.x == 3){
      arrlist.add(corners.get(1));
      arrlist.add(corners.get(0));
    }
    loadPixels();
    for(int i=0; i<screen.pixels.length;i++){
      if (screen.pixels[i]==web){screen.pixels[i]=background;}
    }
    updatePixels();
  }
  //print(arrlist);
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
    if(direction.x==0&&direction.y==0){return;}
    //Step on own web
    
    try{if (screen.pixels[int(x+direction.x+(y+direction.y-200)*width)]==web){
      alive=false;
      isPlaying=false;
      println("dead web");
      
    }} catch(Exception E){}
    
    //If monster steps on your web
    if (screen.pixels[int(m.x+(m.y-200)*width)]==web){
      alive=false;
      isPlaying=false;
      println("dead mon web");
      println(m.x,m.y);
      println(x,y);
      
    }
    //Killed by monster
    if (dist(m.x,m.y,x,y)<30){
      alive=false;
      isPlaying=false;
      println("dead kill");
     
    }
    if (alive==false){
      
      isPlaying=false;
   
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
  PVector findSides(PVector v1, PVector v2){
      if (v1.y <= 198.0) {
        side1 = 0;
      }
      if (v1.x >= 698.0) {
        side1 = 1;
      }
      if (v1.y >= 698.0) {
        side1 = 2;
      }
      if (v1.x <= 2.0) {
        side1 = 3;
      }
       if (v2.y <= 198.0) {
        side2 = 0;
      }
      if (v2.x >= 698.0) {
        side2 = 1;
      }
      if (v2.y >= 698.0) {
        side2 = 2;
      }
      if (v2.x <= 2.0) {
        side2 = 3;
      }
      sides = new PVector(side1,side2);
      return(sides);
  }   
  Boolean outBounds(){
    return x<1||y<201||x>width-1||y>height-1;
  }
}