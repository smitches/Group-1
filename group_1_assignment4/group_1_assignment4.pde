import processing.sound.*;
SoundFile engine;
Car car1, car2,car3;


void setup(){
  size(600,600);
  engine = new SoundFile(this,"engine.mp3");
  car1 = new Car(0,300,color(25,100,25),40);
  car2 = new Car(0,50,color(100,25,100),40);
  car3= new Car(400,50,color(220,10,10),40);
  engine.play();
}

void draw () {
  if (frameCount%(16*10)==0){engine.play();}
  background(50,50,50);
  car1.Move();
  car1.Display();
  car2.Move();
  car2.Display();
  car3.Move();
  car3.Display();
}