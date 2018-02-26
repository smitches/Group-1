import processing.sound.*;
SoundFile engine;
Car car1, car2,car3;
Cloud cloud1,cloud2;


void setup(){
  size(600,600);
  engine = new SoundFile(this,"engine.mp3");
  car1 = new Car(00,300,color(25,100,25),40);
  car2 = new Car(200,50,color(100,25,100),40);
  car3= new Car(450,50,color(220,10,10),40);
  engine.play();
  cloud1=new Cloud(0,1);
  cloud2= new Cloud(200,-1);
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
  noLoop(); 
  
}