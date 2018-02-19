Car car1;
void setup(){
  size(600,600);
  car1 = new Car(0,215,color(25,100,25),40);
}

void draw () {
  background(200);
  car1.Move();
  car1.Display();
  //noLoop();
}