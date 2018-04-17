class Graph {
  
 FloatList female;
 FloatList male;
 // GUISlider slider;
 int rownum; //aka plantnum
 int x;
 int y;
 int increment = 10;
 
 Graph (FloatList _female, FloatList _male) { // GUISlider _slider
   female = _female;
   male = _male;
   // slider = _slider;
 }
   

  void update() {
  // Update graph based on slider
     String hello = "Hello"; // hollyyyy pls pass
    }

  void display() {
    
    // Draw slider
    line(550, 250, 750, 250);
    
    // Just goes between male and female
    fill(0,0,0);
    text("Male", 555, 310);
    text("Female", 745, 310);
  }
    
  
}