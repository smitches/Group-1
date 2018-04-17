Table table;
StringList Hair;
StringList Eye;
StringList Gender;
FloatList Female;
FloatList Male;
IntList Freq; 
Graph data;

void setup(){
  size(800,500);
  table = loadTable("HairEyeColor.csv", "header");
  
  int rows = table.getRowCount();
  
  int cols = table.getColumnCount();
  
  Female = new FloatList();
  female = new 
  Male = new FloatList();
  //slider = new Slider();
  
  data = new Graph (female, male); // Might not need the flower growing
  
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
  
  

}

void draw() {
  data.display();
}