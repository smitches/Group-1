
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
class RadioButton{
  int current; 
 
  
  RadioButton(){
    current = 0;
  }
  
  void display(){
   noFill(); 
   ellipse(15,495,20,20); 
   ellipse(150,495,20,20); 
   ellipse(260,495,20,20); 
   ellipse(420,495,20,20);
   ellipse(550,495,20,20);
   
   fill(0);
   
   if (current == 0){
     ellipse(15,495,5,5); 
   }
   else if (current == 1){
     ellipse(150,495,5,5); 
   }
   else if (current == 2){
     ellipse(260,495,5,5);
   }
   else if (current == 3){
     ellipse(420,495,5,5); 
   }
   else if (current == 4){
     ellipse(550,495,5,5); 
   }
  }
  void setCurrent(int x){
    current = x; 
  }
  
  int getCurrent(){
    return (current);
  }

}
