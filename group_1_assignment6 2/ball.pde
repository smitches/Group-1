class Ball{
  float x,y,r,vx,vy,m;
  color c;
  Ball(float x, float y, float r, float vx, float vy, color c){
    this.x=x;this.y=y;this.r=r;this.vx=vx; this.vy=vy; this.c=c; m=150;
  }
  void display(){x+=vx;y+=vy;fill(c);ellipse(x,y,r,r);
    if (x>width){vx*=-1;x-=10;}
    if (x<0){vx*=-1;x+=10;}
    if (y>height*.92){vy=-vy;y-=10;}
    if (y<0){vy=-vy;}
  }
  void applyForce(PVector force){
    float ax= force.x/m;
    float ay=force.y/m;
    vx+=ax; vy+=ay;
  }
  void applyGravity(){
    this.vy+=.07;
    
  }
  void collide(Ball b){
    if (dist(x,y,b.x,b.y)>25){return;}
    if (b.x<x){b.vx=-1*abs(vx);vx=abs(vx);}
    else{b.vx=abs(vx);vx=-1*abs(vx);}
  }
}
