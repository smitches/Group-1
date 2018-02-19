class Car {
  color c;
  float x;
  float y;
  float direction;
  PShape car;
  PShape lwheel;
  PShape rwheel;
  float angle;
  
  Car(float x, float y, color c, float r){
    shapeMode(CENTER);
    this.car = createShape(GROUP);
    this.car.translate(x,y);
    this.x=x;
    this.y=y;
    this.direction=1;
    this.c=c;
    fill(255);
    lwheel = loadShape("Wheel.svg");
    lwheel.scale(.38);
    lwheel.translate(x,y+200);
    rwheel = loadShape("Wheel.svg");
    rwheel.scale(.38);
    rwheel.translate(x+150,y+200);
    fill(c);
    PShape body = createShape(RECT, this.x,this.y,100,50);
    fill(255);
    noStroke();
    PShape left_wheel = createShape(ELLIPSE, this.x+80,this.y+50,r,r);
    PShape right_wheel = createShape(ELLIPSE, this.x+20, this.y+50, r, r);
    this.car.addChild(body);
    this.car.addChild(left_wheel);
    this.car.addChild(right_wheel);
    this.car.addChild(rwheel);
    this.car.addChild(lwheel);
    
  }
  void Move(){
    if (this.x>=width){this.x-=width;}
    this.x+=direction;
  }
  void Display(){
    shapeMode(CENTER);
    shape(this.car,this.x,this.y);
    //shape(this.car,this.x-width, this.y);
    //shape(this.car,this.x+width,this.y);
    //shape(this.car,this.x,this.y+height);
    //shape(this.car,this.x,this.y-height);
    this.lwheel.translate(64,64);
    this.lwheel.rotate(.03);
    this.lwheel.translate(-64,-64);
    this.rwheel.translate(64,64);
    this.rwheel.rotate(.03);
    this.rwheel.translate(-64,-64);
    //float x = 150;
    //float y = 250;
    //this.car.translate(x,y);
    //this.car.rotate(-.01);
    //this.car.translate(-x,-y);
  }
}