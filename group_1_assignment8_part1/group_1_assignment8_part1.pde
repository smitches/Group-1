Table table;
IntList Freq; 
Graph data;
Slider slide, slide1;

void setup(){
  size(800,500);
  table = loadTable("HairEyeColor.csv", "header");
  
  int rows = table.getRowCount();
  
  int cols = table.getColumnCount();
  
  //Female = new FloatList();
  //female = new 
  //Male = new FloatList();
  //slider = new Slider();
  
  //data = new Graph (female, male); // Might not need the flower growing
  
  //for (int r = 0; r < rows; r++) {
  //  TableRow row = table.getRow(r);
  //  float weight = row.getFloat("weight");
    
  //  if (r < 10) {
  //    Hair.append(weight); 
  //  }
  //  else if ( r >= 10) {
  //    Eye.append(weight);
  //  }
  //  else if ( r >= 20) && (r < 30) {
  //    Sex.append(weight);
  
  //data.update();
  slide = new Slider(0,0,390,10,0,0);
  slide1 = new Slider(500,150,30,10,0,0);

}

void draw() {
  background(#FFEAF1);
    //draw the axes
  line(100,400,550,400);
  line(100, 75,100,400);
  
  //write in the axis titles
  
  //Main title
  textSize(25);
  text("Student Hair/Eye/Sex", 150,50);
  
  //horizontal axis
  textSize(15);
  text("Hair Color", 250,470);
  
  //vertical axis
  int x = 30;
  int y = 290;
  pushMatrix();
  translate(x,y);
  rotate(-HALF_PI);
  translate(-x,-y);
  text("Frequency (people)", x,y);
  popMatrix();
  
  for (int i = 0; i < 16; i ++){
      text(((i+1) * 5), 60, (385- (i * 20)));}
  
  for (int i = 0; i < 17; i ++){
      line(90, (400 - (i * 20)), 110, (400 - (i * 20)));}
  
  text("Black", 150,420);
  text("Brown", 250,420);
  text("Red", 350,420);
  text("Blonde", 450,420);
  
  slide.update(mouseX, mouseY);
  slide.display();
  slide1.update(mouseX, mouseY);
  slide1.display();
  
 
}
void mousePressed() {
  slide.pressed(mouseX, mouseY);
  slide1.pressed(mouseX, mouseY);
}

void mouseReleased() {
  slide.released();
  slide1.released();
}