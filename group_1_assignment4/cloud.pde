class Cloud {
  //color c; 
  float x,y,z;
  
  float directionx; 
  PShape unit, cloud, rain, whitecloud;

  
  Cloud(float x, float direction){
    shapeMode(CENTER); 
    //ellipseMode(CORNERS);
    this.unit = createShape(GROUP); 
    this.z = 1;
    this.x = x; 
    this.y = 10;
    this.directionx=direction;
    this.cloud = loadShape("cloud.svg"); 
    cloud.scale(2); 
    this.rain = loadShape("rain.svg"); 
    rain.scale(0.2);
    rain.translate(0,150);
    this.unit.addChild(cloud);
    this.unit.addChild(rain);
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
    
    this.rain.translate(0, this.z);
    if (frameCount % 50 == 0){
      this.z *= -1;}
  }
  
  void Display(){
    shapeMode(CENTER); 
    shape(this.unit, this.x,this.y); 
   
  }    
}