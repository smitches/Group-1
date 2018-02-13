String [] lines;
PFont courier;
int Size;
void setup(){
  size (700,600);
  background(0);
  Size=32;
  courier = createFont("cour.ttf",Size);
  lines = loadStrings("uniquewords.txt");
}
void draw() {
  color blue = color(66,185,244);
  color pink = color (244,66,158);
  color orange = color(244,182,66);
  color [] colors={blue,pink,orange};
  textFont(courier);

  textAlign(RIGHT);
  String leftbox="", rightbox="", bottombox="";
  textLeading(30);
  while (leftbox.length()<500){
      String newWord = lines[int(random(lines.length))];
      if (newWord.length()>10){continue;}
      fill(color(30,144,255));
      leftbox+=newWord+" ";

//      if (j+textWidth(lines[newWord])>=700){break;}
      println(leftbox);
       
    }
    text(leftbox,0,25,350,300);
  textAlign(CENTER);
  while (bottombox.length()<1500){
    String newWord = lines[int(random(lines.length))];
    if (newWord.length()>10){continue;}
    fill(color(255,67,67));
    bottombox+=newWord+" ";
  }
  text(bottombox,25,300,650,300);
  textAlign(LEFT);
    while (rightbox.length()<500){
      String newWord = lines[int(random(lines.length))];
      if (newWord.length()>10){continue;}
      fill(color(255));
      rightbox+=newWord+" ";
    }
    text(rightbox,400,25,300,300);

  noLoop();
}