Cloud cloud1;
void setup(){
  cloud1=new Cloud(0,1);
}
void draw(){
  background(255);
  cloud1.move();
  cloud1.display();
}