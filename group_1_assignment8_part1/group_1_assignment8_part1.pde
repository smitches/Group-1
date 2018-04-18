Table table;
IntList BrownM, BlueM, HazelM, GreenM, BrownF, BlueF, HazelF, GreenF; 
ArrayList<IntList> entries;
Bars bars;
Slider EyeSlide, GenSlide;

void setup(){
  size(800,500);
  table = loadTable("HairEyeColor.csv", "header");
  entries = new ArrayList<IntList>(8);
  BrownM = new IntList(4);
  BlueM = new IntList(4);
  HazelM = new IntList(4);
  GreenM = new IntList(4);
  BrownF = new IntList(4);
  BlueF = new IntList(4);
  HazelF = new IntList(4);
  GreenF = new IntList(4);
  int rows = table.getRowCount();
  
  for (int r = 0; r < rows; r++) {
  TableRow row = table.getRow(r);
  int freq = row.getInt("Freq");
  if (r<4){
    BrownM.append(freq);
  }else if (4 <= r && r <8){
    BlueM.append(freq);
  }else if (8 <= r && r <12){
    HazelM.append(freq);
  }else if (12 <= r && r <16){
    GreenM.append(freq);
  }else if (16 <= r && r <20){
    BrownF.append(freq);
  }else if (20 <= r && r <24){
    BlueF.append(freq);
  }else if (24 <= r && r <28){
    HazelF.append(freq);
  }else {
    GreenF.append(freq);
  }
}
  entries.add(BrownM);
  entries.add(BlueM);
  entries.add(HazelM);
  entries.add(GreenM);
  entries.add(BrownF);
  entries.add(BlueF);
  entries.add(HazelF);
  entries.add(GreenF);
 
  EyeSlide = new Slider(625,100,100,20,0,0);
  GenSlide = new Slider(625,250,40,20,0,0);
  bars = new Bars(entries, EyeSlide, GenSlide);

}

void draw() {
  background(#FFEAF1);
    //draw the axes and titles
  line(100,400,550,400);
  line(100, 80,100,400);
  textSize(25);
  text("Student Hair/Eye/Sex", 180,50);
  textSize(18);
  text("Hair Color", 268,460);
  int x = 40;
  int y = 315;
  pushMatrix();
  translate(x,y);
  rotate(-3.1415/2);
  translate(-x,-y);
  text("Frequency (people)", x,y);
  popMatrix();
  textSize(14);
  for (int i = 0; i < 14; i ++){
      text(((i+1) * 5), 60, (385- (i * 23)));}
  
  for (int j = 0; j < 15; j ++){
      line(90, (400 - (j * 23)), 110, (400 - (j * 23)));}
  
  text("Black", 150,420);
  text("Brown", 250,420);
  text("Red", 350,420);
  text("Blonde", 445,420);
  text("Eye Color:", 625, 90);
  text("Sex:", 625, 240);
  EyeSlide.update(mouseX, mouseY);
  EyeSlide.display();
  GenSlide.update(mouseX, mouseY);
  GenSlide.display();
  bars.update();
 
}
void mousePressed() {
  EyeSlide.pressed(mouseX, mouseY);
  GenSlide.pressed(mouseX, mouseY);
}

void mouseReleased() {
  EyeSlide.released();
  GenSlide.released();
 
}