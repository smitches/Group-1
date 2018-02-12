String [] lines;
PFont courier;
void setup(){
  size (700,600);
  background(255);
  courier = createFont("Courier",32);
  lines = loadStrings("uniquewords.txt");
}
void draw() {
  color blue = color(66,185,244);
  color pink = color (244,66,158);
  color orange = color(244,182,66);
  textFont(courier);
  int newWord = int(random(lines.length));
  println(lines[newWord]);
  noLoop();
}