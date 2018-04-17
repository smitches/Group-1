class Button{
  float x,y;
  Button(float x, float y){this.x=x; this.y=y;}
}
class CircleButton extends Button{
  float r;
  CircleButton(float x, float y, float r){
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

class Radio {
  Radio[] group;
  float id,x,y;
  boolean checked=false;
  String text;
  Radio(Radio[] group, float id, String text,float X, float Y){
    this.id=id; this.group=group;this.text = text;x=X;y=Y;
  }
  boolean inRange(){return dist(mouseX,mouseY,x,y)<15;}
  void check(){checked=true; for (Radio r : group){if (r.id!=this.id){r.checked=false;}}}
  void display(){strokeWeight(15); stroke(255); point(x,y); textAlign(LEFT);
                 text(text, x+20, y+5); if(checked){strokeWeight(10); stroke(0); point(x,y);}
  }
}
