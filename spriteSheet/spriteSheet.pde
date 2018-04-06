Timer t; 
PImage spriteSheet;
PImage[] imgArray = new PImage[8];
PImage[] spriteArray = new PImage[8];
PVector[] coords = new PVector[8];
int spriteH=1024/4, spriteW=1024/2;

void setup(){size(600,600);frameRate(20);spriteSheet=loadImage("cougar.png");
t = new Timer(100,8);
  int x=0,y=0;
  for (int i=0; i<8; i++){
    //populate img array from multiple images
    imgArray[i]=loadImage("cougar"+nf(i+1,2)+".png");
    
    //populate spritesheet array from single image
    spriteArray[i]=spriteSheet.get(x,y,spriteW,spriteH);
    
    //populate pvector array with coordinates to spritesheet
    coords[i] = new PVector(x,y);
    
    //update x and y coords
    if ((i+1)%2==0){
      x=0;
      y+=spriteH;
    }
    else{x=spriteW;}
  }
    
}

void draw(){
  background(0);
  int i = t.getIndex();
  image(spriteSheet.get(int(coords[i].x),int(coords[i].y),spriteW,spriteH),0,0);
  //image(imgArray[i],0,0);
  //image(spriteArray[i],0,0);
  if (frameCount%20 == 0 && frameCount< 1000){
    //saveFrame("img###.png");
  }
}
void mouseClicked(){t.click();}
