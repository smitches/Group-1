Stack stack1,stack2;
Box box1 box2;
void setup(){
  size(650,650,P3D);
  stack1 = new Stack(000,100,0);
  stack2 = new Stack(300,-100,0);
  box1 = new Box();
  box2 = new Box();
}

void draw(){
  camera(width/2,-300,700,width/2,100,stack1.z,0,1,0);
  background(0);
  stack1.Move();
  stack1.Display();
  //stack2.Move();
  //stack2.Display();
  //stack1.stack.rotateZ(.01);
  
  box1.Display();
  box2.Display();
}