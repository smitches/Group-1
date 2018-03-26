class Water{
  float x,y,w,h,vx,vy,m;
  Fountain f;
  Water(float w, float h, Fountain f){
    this.x=f.x;this.y=(f.y+75);this.w=w;this.h=h;this.m=w*h;
    this.f=f;
    vx=0;vy=0;
  }
  void Move(){
    this.x+=vx;
    this.y+=vy;
  }
  void applyForce(PVector vectorF){
    float ax= vectorF.x/m;
    float ay=vectorF.y/m;
    vx+=ax;
    vy+=ay;
  }
  void applyGravity(){
    if(this.x!=f.x || this.y!=(f.y+75)){
      this.vy+=.07;
    }  
  }
  void Display(){
    fill(26,203,255);
    noStroke();
    ellipse(x,y,w,h);
    if (x<-10||x>width||(y>(f.y+75)&&abs(x-f.x)<f.poolradius)||y>height){
      this.x=f.x;
      this.y=f.y+75;
      this.vx=0;
      this.vy=0;
    }
  }
}