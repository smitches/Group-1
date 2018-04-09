class Button{
  float x,y;
  Button(float x, float y){this.x=x; this.y=y;}
}
class CircleButton extends Button{
  float r;
  CircleButton(float x, float y, float r, String label){
    super(x, y);
    this.r =r;
  }
  boolean inRange(){ return (dist(mouseX,mouseY,x,y)<r);}
  void display(){ fill(200,0,0);ellipse(x,y,r,r);}
}
class RectButton extends Button{
  float w, h;
  RectButton(float x, float y, float w, float h){
    super(x,y);
    this.w=w; this.h=h;
  }
  boolean inRange(){ return (x<mouseX && mouseX<(x+w) && y<mouseY && mouseY<(y+h));}
  void display(){ fill(0,0,200); rect(x,y,w,h);}
}