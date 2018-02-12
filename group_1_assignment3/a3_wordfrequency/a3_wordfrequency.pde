void setup(){
  String[] lines = loadStrings("uniquewords.txt");
  String[] FreqLines = loadStrings("wordfrequency.txt");
  int numUniqueWords = lines.length;
  int SizeWords = FreqLines.length;
  int intArray[];
  int DiffArray[];
  intArray = new int[SizeWords];
  DiffArray = new int[SizeWords];
  for(int i = 0; i < FreqLines.length; i++){
    String freqline = FreqLines[i];
    String[] num = freqline.split(" ");
    intArray[i] = int(num[1]);
  }
  for(int j = 0; j < intArray.length; j++){
    if (j != intArray.length - 1) {
      int Diff = intArray[j] - intArray[j+1];
      DiffArray[j] = Diff;
    }else {
      DiffArray[j] = intArray[j];
    }
  }
}

int AngleArray[](array, total) {
  int AngleArray[];
  AngleArray = new int[array.length];
  for(int i = 0; i < array.length; i++){
    float angle = array[i]/total*360;
    int newAngle = Math.round(angle);
    AngleArray[i] = newAngle;
  }
}


void draw() {
  background(100);
  pieChart(300, AngleArray[](DiffArray, numUniqueWords));
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