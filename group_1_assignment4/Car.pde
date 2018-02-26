class Car {
  color c;
  float x;
  float y;
  float directionx, directiony;
  PShape car;
  PShape lwheel;
  PShape rwheel;
  float angle;
  float tx=20, ty=100;
  
  Car(float x, float y, color c, float r){
    shapeMode(CENTER);
    this.car = createShape(GROUP);
    this.car.translate(tx,ty);
    this.x=x;
    this.y=y;
    this.directionx=1;
    this.directiony=0;
    this.c=c;
    fill(255);
    lwheel = loadShape("Wheel.svg");
    lwheel.scale(.38);
    lwheel.translate(-10,333);
    rwheel = loadShape("Wheel.svg");
    rwheel.scale(.38);
    rwheel.translate(147,333);
    fill(c);
    stroke(0);
    strokeWeight(3);
    PShape body = createShape(RECT, 0,100,100,50);
    fill(255);
    noStroke();
    PShape left_wheel = createShape(ELLIPSE, 20,150,40,40);
    PShape right_wheel = createShape(ELLIPSE, 80,150, 40, 40);
    this.car.addChild(body);
    this.car.addChild(left_wheel);
    this.car.addChild(right_wheel);
    this.car.addChild(rwheel);
    this.car.addChild(lwheel);
    
  }
  void Move(){
    if (this.x>=width-150&&this.directionx==1){
      //this.x-=width;
      this.directionx=0;
      this.directiony=-1;
      this.car.translate(-50,200);
      this.car.rotate(HALF_PI*3);
      this.y-=30;
      engine.play();
    }
    if (this.y>=height-330&&this.directiony==1){
      this.directionx=1;
      this.directiony=0;
      this.car.resetMatrix();
      this.car.translate(tx,ty);
      this.y+=50;
      engine.play();
}
    if (this.y<=0&&this.directiony==-1){
      this.directionx=-1;
      this.directiony=0;
      this.car.translate(-100,20);
      this.car.rotate(HALF_PI*3);
      this.car.translate(-110,30);
      engine.play();
  }
    if (this.x<=15&&this.directionx==-1){
      this.directionx=0; 
      this.directiony=1;
      this.car.rotate(HALF_PI*3);
      this.car.translate(-140,-60);
      engine.play();
    }

    this.x+=directionx;
    this.y+=directiony;
    
  }
  void Display(){
    shapeMode(CENTER);
    shape(this.car,this.x,this.y);
    this.lwheel.translate(64,64);
    this.lwheel.rotate(.03);
    this.lwheel.translate(-64,-64);
    this.rwheel.translate(64,64);
    this.rwheel.rotate(.03);
    this.rwheel.translate(-64,-64);
  }
}