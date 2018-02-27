class Cat {
  float x,y,directionx,LB, RB;
  PShape body, tail, cat;
  float angle = .01;
  float swing = -1;
  Cat(float x, float y, float direction, float left, float right) {
    this.x=x;
    this.y=y;
    this.directionx = direction;
    this.LB = left;
    this.RB = right;
    this.cat=createShape(GROUP);
    this.tail = loadShape("tail.svg");
    this.body = loadShape("cat.svg");
    tail.scale(0.7);
    cat.scale(0.38);
    tail.translate(28,100);
    tail.rotate(PI*.5);
    this.cat.addChild(body);
    this.cat.addChild(tail);
  }
  void Move() {
    if (this.x<=LB){this.directionx=1;}
    else if (this.x>=RB){this.directionx=-1;}
    this.x+=this.directionx;
    this.tail.rotate(angle*swing);
    if (frameCount%300==0){swing*=-1;}
  }
  void Display() {
    shape(cat, x, y); 
  }
 

}