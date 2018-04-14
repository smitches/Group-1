
class Button{
  float x,y; 
  Button(float x, float y){
    this.x = x;
    this.y = y;
  }
}
class PreviousButton extends Button{
  float p,z;
  PreviousButton(float x, float y, float p, float z){
    super(x,y);
    this.p = p;
    this.z = z; 
  }
  
  boolean over(){
    return (x<mouseX && mouseX<(x+p) && y<mouseY && mouseY<(y+z));
  }
  void display(){
    fill(200,0,0);
    rect(x,y,p,z); 
  }
  
}

class NextButton extends Button{
  float n,h; 
  NextButton(float x,float y, float n, float h){
    super(x,y);
    this.n = n;
    this.h = h;
  }
  boolean over(){
    return (x<mouseX && mouseX<(x+n) && y<mouseY && mouseY<(y+h));
  }
  void display(){
    fill(0,0,200);
    rect(x,y,n,h); 
    
  }
}
    