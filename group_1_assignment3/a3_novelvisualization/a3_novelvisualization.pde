String [] lines;
PFont courier;
int Size;
void setup(){
  size (700,600);
  background(255);
  Size=32;
  courier = createFont("Courier",Size);
  lines = loadStrings("uniquewords.txt");
}
void draw() {
  color blue = color(66,185,244);
  color pink = color (244,66,158);
  color orange = color(244,182,66);
  color [] colors={blue,pink,orange};
  textFont(courier);
  
  for (int i=25; i<585;){
    for (int j=0; j<700;){
      int newWord = int(random(lines.length));
      fill(colors[int(random(0,3))]);
      if (j+textWidth(lines[newWord])>=700){break;}
      text(lines[newWord],j,i);
      j+=textWidth(lines[newWord]+5);
    }
    i+=Size;
  }
  noLoop();
}