Stack stack1;
void setup(){
  size(650,650,P3D);
  stack1 = new Stack(000,100,0);
}

void draw(){
  background(0);
  stack1.Move();
  stack1.Display();
}