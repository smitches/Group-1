class Ball {
  PShape ball; 
  float x, y, z; 
  //make float x = 100 to call it later
  //play around in increments 
  float angle, direction; 
  
  Ball(float x, float y, float z){
    shapeMode(CENTER); 
    this.x=x; 
    this.y=y; 
    this.z=z; 
    
    ball = createShape(GROUP); 
    direction = 1; 
  }
  
  void Move(){
    if (x>width){
      direction = -1; 
    }
    else if (x<0){
      direction = 1; 
    }
    x+= direction; 
    angle += .05; 
    
  }
  
  void Display(){
  
  fill(185, 66, 244); 
  pushMatrix();
  translate(x,y,z);
    pushMatrix(); 
    rotateX(radians(frameCount*3)); 
    rotateY(radians(frameCount*3)); 
 
    translate(width/2, height/2, 0); 
    
    sphere(100); 
    popMatrix(); 
    

    pushMatrix(); 
    fill(244,233,66); 
    rotateY(radians(frameCount*2)); 
    translate(width/2, height/2, 0); 
    translate(-200,0); 
    sphereDetail(10); 
    sphere(50); 
    popMatrix(); 
    popMatrix();
  }
}