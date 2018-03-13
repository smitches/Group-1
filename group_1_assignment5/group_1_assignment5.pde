Stack stack1,stack2;
Box box1, box2 ;
Ball ball1, ball2; 
void setup(){
  size(650,650,P3D);
  stack1 = new Stack(-100,00,0);
  stack2 = new Stack(300,-200,0);
  
  box1 = new Box(0, -100);
  box2 = new Box(200, -100);
  
  ball1 = new Ball(50, 400, -400); 
  ball2 = new Ball(450, 0, -200); 
}

void draw(){
  camera(width/2,-300,700,width/2,200,stack1.z,0,1,0);
  background(0);
  stack1.Move();
  stack1.Display();
  stack2.Move();
  stack2.Display();
  stack1.stack.rotateZ(.01);
  
  box1.Display();
  box2.Display();
  
  ball1.Move(); 
  ball1.Display(); 
  ball2.Move(); 
  ball2.Display(); 
  
}