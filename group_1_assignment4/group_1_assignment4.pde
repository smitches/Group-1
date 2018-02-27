import processing.sound.*;
SoundFile engine;
Car car1, car2,car3;
Cloud cloud1,cloud2;
Cat cat1, cat2;

void setup(){
  size(600,600);
  engine = new SoundFile(this,"engine.mp3");
  car1 = new Car(00,325,color(25,100,25));
  car2 = new Car(300,325,color(100,25,100));
  car3= new Car(450,50,color(220,10,10));
  engine.play();
  cloud1=new Cloud(0,1);
  cloud2= new Cloud(200,-1);
  cat1 = new Cat(265, 280, 1, 80, 450);
  cat2 = new Cat(265, 400, -1, 150, 450);
}

void draw () {
  //if (frameCount%(16*10)==0){engine.play();}
  background(#FFF979);
  car1.Move();
  car1.Display();
  car2.Move();
  car2.Display();
  car3.Move();
  car3.Display();
  
  cloud1.Move();
  cloud2.Move();
  cloud1.Display();
  cloud2.Display();
  
  cat1.Move();
  cat1.Display();
  cat2.Move();
  cat2.cat.rotate(.01);
  cat2.Display();
  
}