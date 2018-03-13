class Stack {
  PShape stack;
  float x, y, z,initx;
  float subx,suby,subz, angle,direction;
  Stack(float x, float y, float z){
    this.x=x;this.y=y;this.z=z;
    initx=x;
    subx=100;suby=40;subz=100;
    direction=1;
    stack = createShape(GROUP);
  }
  
  void Move(){
    if (x>width) {
      direction=-1;
    }
    else if (x<0) {
      direction=1;
    }
    if(!(direction==-1 && x==width/2)) {
      x+=direction;
    }
    angle+=.05;
  }
  
  void Display(){
    pushMatrix();
    translate(initx+(x-initx),0,0);
    rotateY(angle);
    translate(-initx-(x-initx),0,0);
    
    pushMatrix();
    translate(x,y,z);
    fill(80,150,90);
    box(subx,suby,subz);
    popMatrix();
    
    pushMatrix();
    translate(x,y+suby,z);
    fill(200,0,50);
    rotateY(-2*angle);
    box(subx,suby,subz);
    popMatrix();
    
    pushMatrix();
    translate(x,y+2*suby,z);
    rotateY(-1*angle);
    fill(0,200,200);
    box(subx,suby,subz);
    popMatrix();
    
    pushMatrix();
    translate(x,y+3*suby,z);
    fill(200,200,0);
    box(subx,suby,subz);
    popMatrix();
    
    pushMatrix();
    translate(x,y+4*suby,z);
    fill(200);
    rotateY(-2*angle);
    box(subx,suby,subz);
    popMatrix();
    
    popMatrix();
  }
}