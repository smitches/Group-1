Car car1, car2;
void setup(){
  size(600,600);
  car1 = new Car(0,150,color(25,100,25),40);
  car2 = new Car(0,50,color(100,25,100),40);
  
}

void draw () {
  background(200);
  car1.Move();
  car1.Display();
  car2.Move();
  car2.Display();
}