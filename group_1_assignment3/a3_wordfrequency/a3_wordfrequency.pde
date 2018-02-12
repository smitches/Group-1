int numUniqueWords;
int DiffArray[];
int totalWords;

void setup(){
  size(640, 360);
  noStroke();
  String[] FreqLines = loadStrings("wordfrequency.txt");
  int SizeWords = FreqLines.length;
  int intArray[];
  intArray = new int[SizeWords];
  DiffArray = new int[SizeWords];
  for(int i = 0; i < FreqLines.length; i++){
    String freqline = FreqLines[i];
    String[] num = freqline.split(" ");
    intArray[i] = int(num[1]);
  }
  totalWords = intArray[0];
  for(int j = 0; j < intArray.length; j++){
    if (j != intArray.length - 1) {
      int Diff = intArray[j] - intArray[j+1];
      DiffArray[j] = Diff;
    }else {
      DiffArray[j] = intArray[j];
    }
  }
}

int[] AngleArray(int[] array, int total) {
  int modAA[];
  int AA[];
  int sum = 0;
  int idxLen = 0;
  int max = array.length;
  AA = new int[max];
  for(int i = 0; i < max; i++){
    float angle = (float)array[i]/total*360;
    int newAngle = Math.round(angle);
    AA[i] = newAngle;
  }
  for(int j = 0; j < max; j++) {
    if (AA[j] == 1) {
      idxLen = j;
      break;
    }
  }
  modAA = new int[idxLen+1];
  for(int k = 0; k < max; k++) {
    if ((AA[k] != 1 || AA[k] != 0) && k < idxLen) {
      modAA[k] = AA[k];
      sum += AA[k];
    }
  }
  int onePercent = 360 - sum;
  modAA[idxLen] = onePercent;
  println(modAA);
  return(modAA);
}


void draw() {
  background(100);
  pieChart(300, AngleArray(DiffArray, totalWords));
  noLoop();
}

void pieChart(float diameter, int[] data) {
  float lastAngle = 0;
  for (int i = 0; i < data.length; i++) {
    float gray = map(i, 0, data.length, 0, 255);
    fill(gray);
    arc(width/2, height/2, diameter, diameter, lastAngle, lastAngle+radians(data[i]));
    lastAngle += radians(data[i]);
  }
}