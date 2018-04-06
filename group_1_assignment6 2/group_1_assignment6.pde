Fountain f1, f2;
float counter=0, windmagnitude, windangle;
int watercount=50;
Water [] waterlist = new Water[watercount];
Water [] waterlist2 = new Water[watercount];
Flock flock1 = new Flock();
//Flock flock2 = new Flock();
PVector wind;
String windtext;
Ball b1, b2;


void setup(){size (700,700,P3D);
  determineWind();
  //camera(width/2,0,0,width/2,height/2,0,0,0,1);
  
  //make fountain 1
  f1=new Fountain(width/2+150,height-175);
  f2=new Fountain(width/2-150,height-175);
  
  b1=new Ball(width/2-150, 50,30,3,0,color(200,0,50));
  b2=new Ball(width/2+200, 50,30,3,0,color(50,225,125));
 
  //make water droplets
  for (int i=0; i<watercount; i++){
    waterlist[i]= new Water(10,15,f1);
    waterlist2[i]=new Water(10,15,f2);
  }
  for (int j = 0; j < 100; j++) {
    PVector v1, v2;
    v1 = new PVector(random(50), random(50));
    //v2 = new PVector(random(50), random(50));
    flock1.addPrey(new Prey(random(700),random(700), v1));
    //flock2.addPrey(new Prey(random(500),random(500), v2));
  }
  
  
}
void draw(){
  background(0);
  fill(255);
  textSize(32);
  text("Wind: " + str(float(round(windmagnitude*1000))/1000),10,40);
  strokeWeight(5);
  stroke(255);
  line(75,95,75+60*cos(windangle)*windmagnitude,95+60*sin(windangle)*windmagnitude); 
  strokeWeight(10);
  point(75,95);
  if (frameCount%200==0){determineWind();}
  if (frameCount%10==0){mousePressed();}
  f1.Display();
  for (Water w:waterlist){
    w.Move();
    w.Display();
    w.applyGravity();
    w.applyForce(wind);
    w.collide(b1);
    w.collide(b2);
}
  f2.Display();
  for (Water w:waterlist2){
    w.Move();
    w.Display();
    w.applyGravity();
    w.applyForce(wind);
    w.collide(b1);
    w.collide(b2);
  }
  b1.display();
  b1.applyForce(wind);
  b1.applyGravity();
  b2.display();
  b2.applyGravity();
  b2.applyForce(wind);
  flock1.run();
  //flock2.run();
  b1.collide(b2);
}

void determineWind(){
  windmagnitude = random(0,1);
  windangle = random(0,2*PI);
  wind= new PVector(2*cos(windangle)*windmagnitude,2*sin(windangle)*windmagnitude); 
}

void mousePressed(){
  waterlist[int(counter%watercount)].vy=-9;
  waterlist2[int(counter%watercount)].vy=-9;
  counter+=1;
}
