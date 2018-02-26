class Cloud {
  //color c; 
  float x,y; 
  float directionx; 
  PShape unit, cloud, rain, whitecloud;

  
  Cloud(float x, float direction){
    shapeMode(CENTER); 
    //ellipseMode(CORNERS);
    //this.unit = createShape(GROUP); 
    
    //this.whitecloud=createShape(GROUP);
    //PShape item= createShape(RECT,100,100,70,50);
    //this.whitecloud.addChild(item);
    
    //item=createShape(ELLIPSE,75,100,125,150);
    //this.whitecloud.addChild(item);
    
    //item=createShape(ELLIPSE, 150, 120, 200, 100); 
    //this.whitecloud.addChild(item); 
    
    //this.rain = loadShape("rain.svg"); 
    
    this.x = x; 
    this.y = 10;
    this.directionx=direction;
    this.cloud = loadShape("cloud.svg"); 
    //this.rain = createShape(RECT, this.x, this.y, 100, 100);       
    this.unit.addChild(this.cloud);
    //this.unit.addChild(this.whitecloud);
    //this.unit.addChild(this.rain);
  }
  
  void Move(){
    if (this.x == width/2)//(change width/2 to a number that works in the acutal file)
    {
      this.directionx = this.directionx*(-1); 
    }
    
    if (this.x==0){this.directionx=1;}
    if(this.x==width)//(change width to whatever number works)
    {this.x=-1;}
    this.x+=this.directionx;
 
  }
  void rain(){
    
  
    
  }
  void Display(){
    shapeMode(CENTER); 
    shape(this.unit, this.x,this.y); 
    //shape(this.rain);
   
  }    
}