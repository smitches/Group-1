class Box {
  float x, y, min_x, min_y, max_x, max_y, dx, dy;
  Box(float x, float y) {
    this.x = x;
    this.y = y;
    this.dx = 10;
    this.dy = -10;
    this.min_x = x;
    this.max_x = width;
    this.min_y = -height/2;
    this.max_y = y;
  }
   

  //float x = 0;
  //float dx = 10;
  //float max_x = width;
  //float min_x = 0;
  
  //float y = -100;
  //float dy = -10;
  //float max_y = -100;
  //float min_y = -height / 2;
  
  void Display() {
    x += dx;
    if (x > max_x || x < min_x) {
      dx *= -1;
    }
    
    y += dy;
    if (y > max_y || y < min_y) {
      dy *= -1;
    }
    
    pushMatrix();
    
    translate(x, 400, 0);
    fill(80, 50, 100);
    box(100, 100, 100);
    
    fill(245, 195, 65);
    translate(0, y+400, 0);
    sphere(50);
    
   popMatrix();
  }
}