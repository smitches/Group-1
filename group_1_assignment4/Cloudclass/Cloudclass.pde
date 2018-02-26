class Cloud{
  color c; 
  float x; 
  float y; 
  float directionx, directiony; 
  PShape rcloud; 
  PShape lcloud; 
  PShape rain; 
  //float tx=20; ty=100; 
  
  int xPos = 200; 
  int xDir=1; 
  
  Cloud(float x, float y, color c, float r){
    shapeMode(CENTER); 
    this.cloud = createShape(GROUP); 
    this.x = x; 
    this.y = y; 
    this.direction=1; 
    this.direction=0; 
    this.c=c; 
    fill(255); 
    lcloud = loadShape("cloud.png"); 
    rcloud = loadShape("cloud.png"); 
}
}
  void move(){
    xPos=xPos+xDir; 
    if (xPos > width-20 || xPos<20)
    {
      xDir-=xDir; 
    }
}
  void display(){
    shapeMode(CENTER); 
    shape(lcloud, 35, 35, 50, 50); 
    shapeMode(CORNER); 
    shape(rcloud, 35, 35, 50, 50); 
  }    