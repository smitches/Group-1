class Slider {
  int x, y;
  float w, h;
  float currentPos;
  float minPos, maxPos;
  boolean isMouseOver;
  boolean isLocked;
  float minVal, maxVal;
  
  Slider(int _x, int _y, float _w, float _h, float _minVal, float _maxVal) {
    x = _x;
    y = _y;
    w = _w;
    h = _h;
    minVal = _minVal;
    maxVal = _maxVal;
    currentPos = x;
    minPos = x;
    maxPos = x + w;
  }
  
  void update(int mx, int my) {
    isMouseOver = isOver(mx, my);
    if (isLocked) {
      currentPos = constrain(mx-(h/2), minPos, maxPos);
    }
  }
  
  void display() {
    fill(255);
    rect(x, y, w+h, h);
    if (isMouseOver) {
      fill(0);
    } else {
      fill(102);
    }
    rect(currentPos, y, h, h);
  }
  
  float getVal() {
    float t = (currentPos - minPos)/(maxPos - minPos);
    return minVal*(1 - t) + maxVal*t;
  }
  
  float getPer() {
    float t = (currentPos - minPos)/(maxPos - minPos);
    return t;
  }
  
  void pressed(int mx, int my) {
    if (isMouseOver) {
      isLocked = true;
    } else {
      isLocked = false;
    }
  }
  
  boolean isOver(int mx, int my) {
    return (mx > x && mx < x+w && my > y && my < y+h);
  }
  
  void released() { 
    isLocked = false;
  }
}