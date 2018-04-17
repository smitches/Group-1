Table zipcode;
ArrayList<City> cities = new ArrayList<City>();
City[] display = new City[3];
Radio[] maxormin = new Radio[3];
Radio [] choosecity = new Radio [3];

void setup(){
  size(500,500);
  zipcode= loadTable("2010_Census_Populations_by_Zip_Code.csv","header");
  
  PVector shift= new PVector(0,50);
  float x=20, y=30;
  maxormin[0]= new Radio(maxormin, 0, "max",x+shift.x, y+shift.y);
  maxormin[1]= new Radio(maxormin, 1, "min",x+shift.x, y*2+shift.y);
  maxormin[2]=new Radio(maxormin,2,"equals",x+shift.x,y*3+shift.y);
  
  shift.y=0;
  x=20; y=30;
  choosecity[0]= new Radio(choosecity, 0, "City 1",x*5+shift.x, y+shift.y);
  choosecity[1]= new Radio(choosecity,1, "City 2",x*10, y + shift.y);
  choosecity[2]=new Radio(choosecity,2,"City 3",x*15,y+shift.y);
  
  for (TableRow r: zipcode.rows()){
    float zip=r.getFloat(0);
    float pop= r.getFloat(1);
    float age =r.getFloat(2);
    float male=r.getFloat(3);
    float female= r.getFloat(4);
    float household =r.getFloat(5);
    float housesize=r.getFloat(6);
    City newcity = new City(zip,pop,age,male,female,household,housesize);
    cities.add(newcity);
  }
  println(cities.get(0).zip);
  for (int i=0; i<3; i++){
    display[i]=cities.get(i);
  }
}


void draw(){
  background(0);
  for (int i =0; i<3; i++){
    display(display[i],i);
  }
  for (Radio r : maxormin){
    r.display();
  }
  
  for (Radio r : choosecity){
    r.display();
  }
}

void mouseClicked(){for (Radio r : maxormin){if (r.inRange()){r.check();}}
                    for (Radio r : choosecity){if (r.inRange()){r.check();}}
                  }

void display(City city, int i){
  textAlign(CENTER);
  float x,y=height-50;
  if (i==1){x=width/2;}
  else if (i==0){x=50;}
  else {x=width-50;}
  text(int(city.zip),x,y);
}
