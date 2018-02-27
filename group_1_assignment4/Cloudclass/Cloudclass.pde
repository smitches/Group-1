

class Cloud {
  //color c; 
  float x,y; 
  float directionx; 
  PShape unit, cloud, rain;

  
  Cloud(float x, float direction){
    shapeMode(CENTER); 
    this.unit = createShape(GROUP); 
    this.x = x; 
    this.y = 10;
    this.directionx=direction;
    this.cloud = loadShape("cloud.svg"); 
    this.rain = loadShape("rain.svg");       
    this.unit.addChild(this.cloud);
    this.unit.addChild(this.rain);
  }
  void move(){
    if (this.x == width/2)
    {
      this.directionx = this.directionx*(-1); 
    }
    this.x+=this.directionx;
 
  }
  void display(){
    shapeMode(CENTER); 
    shape(this.unit, this.x,this.y); 
    //this.rain
  }    
}