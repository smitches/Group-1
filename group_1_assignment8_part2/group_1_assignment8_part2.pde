Table zipcode= loadTable("2010_Census_Populations_By_Zip_Code.csv");
ArrayList<City> cities = new ArrayList<City>();

void setup(){
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
}


void draw(){}
