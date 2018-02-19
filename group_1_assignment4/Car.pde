class Car {
  color c;
  float x;
  float y;
  float direction;
  PShape car;
  Car(float x, float y, color c, float r){
    this.car = createShape(GROUP);
    this.x=x;
    this.y=y;
    this.direction=1;
    this.c=c;
    fill(255);
    PShape wheel = createShape();
    wheel.beginShape();
    //wheel.vertex(this.x+100,this.y+30);
    //wheel.vertex(this.x+130,this.y);
    //wheel.vertex(this.x+100,this.y-30);
    //wheel.vertex(this.x+100-30,this.y);
    //wheel.vertex(this.x+100,this.y+30);
    arc(this.x,this.y,50,50,0,PI);
    wheel.endShape();
    fill(c);
    PShape body = createShape(RECT, this.x,this.y,100,50);
    fill(0);
    PShape left_wheel = createShape(ELLIPSE, this.x+80,this.y+50,r,r);
    PShape right_wheel = createShape(ELLIPSE, this.x+20, this.y+50, r, r);
    this.car.addChild(body);
    this.car.addChild(left_wheel);
    this.car.addChild(right_wheel);
    this.car.addChild(wheel);
    
  }
  void Move(){
    if (this.x>=width){this.x-=width;}
    this.x+=direction;
  }
  void Display(){
    shape(this.car,this.x,this.y);
    shape(this.car,this.x-width, this.y);
  }
}