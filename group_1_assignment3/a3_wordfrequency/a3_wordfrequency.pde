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
  // This gives me an array of all the words that ONLY appeared n number of times in the book
  for(int j = 0; j < intArray.length; j++){
    if (j != intArray.length - 1) {
      int Diff = intArray[j] - intArray[j+1];
      DiffArray[j] = Diff;
    }else {
      DiffArray[j] = intArray[j];
    }
  }
}

// This function converts the difference array into an integer degree array 
int[] AngleArray(int[] array, int total) {
  int modAA[];
  int AA[];
  int sum = 0;
  int idxLen = 0;
  int max = array.length;
  AA = new int[max];
  // Conversion happens here then rounding the float number result into an integer
  for(int i = 0; i < max; i++){
    float angle = (float)array[i]/total*360;
    int newAngle = Math.round(angle);
    AA[i] = newAngle;
  }
  // Trying to figure out where in the Array does the does the degree equals to 1, that way I can initalize the size of my mod array
  for(int j = 0; j < max; j++) {
    if (AA[j] == 1) {
      idxLen = j;
      break;
    }
  }
  // Found out that j = 15, thus, starting from the the 16 freq word, all words are either around 1 degree or lower
  modAA = new int[idxLen+1];
  // I want to tally up the remainder of the words that are 1 degree and less and make them into on group
  for(int k = 0; k < max; k++) {
    if ((AA[k] != 1 || AA[k] != 0) && k < idxLen) {
      modAA[k] = AA[k];
      sum += AA[k];
    }
  }
  // Grouping the 1 degree and lower group together and making it as the last element in my mod Array
  int onePercent = 360 - sum;
  modAA[idxLen] = onePercent;
  //println(modAA);
  return(modAA);
}

//This Code below was found on the Progressing Website of how to program a Pie Chart, I just passed function through it
void draw() {
  background(100);
  pieChart(300, AngleArray(DiffArray, totalWords));
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