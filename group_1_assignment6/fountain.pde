class Fountain{
  float x,y,poolradius;
  PVector poolcenter;
  Fountain(float x, float y){
    this.x=x;this.y=y;
    poolcenter= new PVector(x,y+75,0);
    poolradius=175/2;
  }
  void Display(){
    stroke(255);
    fill(26,203,255);
    pushMatrix();
    translate(x,y+75,0);
    rotateX(PI/2);
    ellipse(0,0,175,175);
    popMatrix();
    strokeWeight(5);
    stroke(255);
    fill(204,209,179);
    noFill();
    pushMatrix();
    translate(x,y,0);
    box(40,150,40);
    popMatrix();    
  }
}
