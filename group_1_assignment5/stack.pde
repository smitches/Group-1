class Stack {
  PShape stack;
  //PShape box1,box2,box3,box4,box5;
  PShape[] mystack={};
  float x, y, z,initx;
  float subx,suby,subz, angle,direction;
  Boolean peeling, piled, falling, piling;
  Stack(float x, float y, float z){
    this.x=x;this.y=y;this.z=z;
    initx=x;
    subx=100;suby=40;subz=100;
    peeling=false; piled=true; falling=false; piling=false;
    direction=1;
    stack = createShape(GROUP);
    //addBox(box1);
    
  }
  
  void Move(){
    if (x>width){direction=-1;}
    else if (x<0){direction=1;}
    x+=direction;
    angle+=.05;
  }
  
  void Display(){
    if (piled){
      pushMatrix();
      translate(subx/2+initx/2+(x-initx),0,0);
      rotateY(angle);
      translate(-subx/2-initx/2-(x-initx),0,0);
      
      pushMatrix();
      translate(x,y,z);
      box(subx,suby,subz);
      popMatrix();
      
      pushMatrix();
      translate(x,y+suby,z);
      rotateY(-2*angle);
      box(subx,suby,subz);
      popMatrix();
      
      pushMatrix();
      translate(x,y+2*suby,z);
      rotateY(-1*angle);
      box(subx,suby,subz);
      popMatrix();
      
      pushMatrix();
      translate(x,y+3*suby,z);
      box(subx,suby,subz);
      popMatrix();
      
      pushMatrix();
      translate(x,y+4*suby,z);
      rotateY(-2*angle);
      box(subx,suby,subz);
      popMatrix();
      
      popMatrix();
    }
    //shape(stack,x,y);
  }
  
  //void addBox(PShape box){
  //  box = makeBox();
  //  stack.addChild(box);
  //  append(mystack,box);
  //}
  
  //PShape makeBox(){
  //  PShape thisbox= createShape();
  //  PImage wood = loadImage("wood.jpg");
  //  thisbox.beginShape();
  //  beginShape(QUAD_STRIP);
  //  thisbox.texture(wood);
  //  thisbox.vertex(0,0,0);
  //  thisbox.vertex(100,0,0);
  //  thisbox.vertex(100,0,-100);
  //  thisbox.vertex(0,0,-100);
  //  thisbox.vertex(0,0,0);
  //  thisbox.vertex(0,100,0);
  //  thisbox.vertex(0,100,-100);
  //  thisbox.vertex(0,0,-100);
  //  thisbox.endShape();
  //  thisbox.translate(100,100,0);
  //  return thisbox;
  //}
}