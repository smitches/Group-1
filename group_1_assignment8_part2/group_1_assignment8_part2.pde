Table zipcode;
ArrayList<City> cities = new ArrayList<City>();
City[] display = new City[3];

void setup(){
  size(500,500);
  zipcode= loadTable("2010_Census_Populations_by_Zip_Code.csv","header");
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
  for (int i =0; i<3; i++){
    display(display[i],i);
  }
}

void display(City city, int x){
  text(city.zip,x*100,100);
  point(x*100,100);
}
