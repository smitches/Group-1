Table zipcode;
ArrayList<City> cities = new ArrayList<City>();
City[] display = new City[3];
Radio[] maxormin = new Radio[3];
Radio [] choosecity = new Radio [3];
Radio [] choice = new Radio [7];
RectButton rb;

String error ="";

String userInput="11111";

void setup(){
  size(500,500);
  rb = new RectButton(width-100,150,100,50);
  zipcode= loadTable("2010_Census_Populations_by_Zip_Code.csv","header");
  
  PVector shift= new PVector(280,20);
  float x=20, y=30;
  maxormin[0]= new Radio(maxormin, 0, "just under",x+shift.x, y+shift.y);
  maxormin[1]= new Radio(maxormin, 1, "just over",x+shift.x, y*2+shift.y);
  maxormin[2]=new Radio(maxormin,2,"equals",x+shift.x,y*3+shift.y);
  shift.y=-10;
  shift.x=10;
  x=80; y=30;
  choosecity[0]= new Radio(choosecity, 0, "City 1",x*0+shift.x, y+shift.y);
  choosecity[1]= new Radio(choosecity,1, "City 2",x*1+shift.x, y + shift.y);
  choosecity[2]=new Radio(choosecity,2,"City 3",x*2+shift.x,y+shift.y);
  
  shift.x=0;
  x=20;
  shift.x=-10; shift.y=50;
  int i=0;
  
  choice[i]=new Radio(choice,i,"zip",x+shift.x,y*i+shift.y);
  i++;
  choice[i]=new Radio(choice,i,"population",x+shift.x,y*i+shift.y);
  i++;
  choice[i]=new Radio(choice,i,"average age",x+shift.x,y*i+shift.y);
  i++;
  choice[i]=new Radio(choice,i,"males",x+shift.x,y*i+shift.y);
  i++;
  shift.x+=125;shift.y-=120;
  choice[i]=new Radio(choice,i,"females",x+shift.x,y*i+shift.y);
  i++;
  choice[i]=new Radio(choice,i,"households",x+shift.x,y*i+shift.y);
  i++;
  choice[i]=new Radio(choice,i,"household size",x+shift.x,y*i+shift.y);
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
  for (i=0; i<3; i++){
    display[i]=cities.get(i);
  }
}


void draw(){
  background(0);
  noStroke();
  fill(150);
  textSize(20);
  rect(width-90,55,85,50);
  fill(255);
  textAlign(CENTER);
  text(userInput,width-48,85);
  textAlign(LEFT);
  text(error, 23,170);
  fill(255);
  textSize(16);
  for (int i =0; i<3; i++){
    display(display[i],i);
  }
  for (Radio r : maxormin){
    r.display();
  }
  
  for (Radio r : choosecity){
    r.display();
  }
  for (Radio r : choice){
    r.display();
  }
  rb.display();
}

void mouseClicked(){for (Radio r : maxormin){if (r.inRange()){r.check();}}
                    for (Radio r : choosecity){if (r.inRange()){r.check();}}
                    for (Radio r : choice){if (r.inRange()){r.check();}}
                    if (rb.inRange()){refresh();}
                  }

void keyPressed(){ if ((key==BACKSPACE||key==DELETE)&&userInput.length()>0){userInput=userInput.substring(0,userInput.length()-1);}
                   if (key=='1'||key=='2'||key=='3'||key=='4'||key=='5'||key=='6'||key=='7'||key=='8'||key=='9'||key=='0'){userInput+=(key);}
}

void display(City city, int i){
  textAlign(CENTER);
  float x,y=height-50;
  if (i==1){x=width/2;}
  else if (i==0){x=50;}
  else {x=width-50;}
  text(int(city.zip),x,y);
  //put the bar graphs associated with the city above the zip code
}

void refresh(){int cityindex=0,operatorindex=0,headerindex=0;
                error="";
                for (int i=0;i<3;i++){
                  if (choosecity[i].checked){ cityindex=int(i);}
                  if (maxormin[i].checked){ operatorindex=int(i);}}
               for (int i=0;i<7;i++){
                 if (choice[i].checked){ headerindex=int(i);}}
                 float targetvalue=float(userInput);
                 ArrayList<City> qualifiers = new ArrayList<City>();
                 for (City c : cities){
                   if (headerindex==0){if(operatorindex==1){if (c.zip>targetvalue){
                     qualifiers.add(c);
                     }}
                     else if(operatorindex==0){if (c.zip<targetvalue){
                     qualifiers.add(c);
                     }}
                     else if(operatorindex==2){if (c.zip==targetvalue){
                     qualifiers.add(c);
                     }}
                   }
                   else if (headerindex==1){if(operatorindex==1){if (c.pop>targetvalue){
                     qualifiers.add(c);
                     println('a');
                     }}
                     if(operatorindex==0){if (c.pop<targetvalue){
                     qualifiers.add(c);
                     println('b');
                     }}
                     if(operatorindex==2){if (c.pop==targetvalue){
                     qualifiers.add(c);
                     println('c');
                     }}
                   }
                   else if (headerindex==2){if(operatorindex==1){if (c.age>targetvalue){
                     qualifiers.add(c);
                     }}
                     else if(operatorindex==0){if (c.age<targetvalue){
                     qualifiers.add(c);
                     }}
                     else if(operatorindex==2){if (c.age==targetvalue){
                     qualifiers.add(c);
                     }}
                   }
                   else if (headerindex==3){if(operatorindex==1){if (c.male>targetvalue){
                     qualifiers.add(c);
                     }}
                     else if(operatorindex==0){if (c.male<targetvalue){
                     qualifiers.add(c);
                     }}
                     else if(operatorindex==2){if (c.male==targetvalue){
                     qualifiers.add(c);
                     }}
                   }
                   else if (headerindex==4){if(operatorindex==1){if (c.female>targetvalue){
                     qualifiers.add(c);
                     }}
                     else if(operatorindex==0){if (c.female<targetvalue){
                     qualifiers.add(c);
                     }}
                     else if(operatorindex==2){if (c.female==targetvalue){
                     qualifiers.add(c);
                     }}
                   }
                   else if (headerindex==5){if(operatorindex==1){if (c.households>targetvalue){
                     qualifiers.add(c);
                     }}
                     else if(operatorindex==0){if (c.households<targetvalue){
                     qualifiers.add(c);
                     }}
                     else if(operatorindex==2){if (c.households==targetvalue){
                     qualifiers.add(c);
                     }}
                   }
                   else if (headerindex==6){if(operatorindex==1){if (c.householdsize>targetvalue){
                     qualifiers.add(c);
                     }}
                     else if(operatorindex==0){if (c.householdsize<targetvalue){
                     qualifiers.add(c);
                     }}
                     else if(operatorindex==2){if (c.householdsize==targetvalue){
                     qualifiers.add(c);
                     }}
                   }
                 }
                 if (qualifiers.size()==0){error="ERROR: No matches found";return;}
                 if (operatorindex==2){display[cityindex]=qualifiers.get(0);}
                 else if (operatorindex==1){if (headerindex==0){float minzip=qualifiers.get(0).zip;
                                                               display[cityindex]=qualifiers.get(0);
                                                               for(City c : qualifiers){
                                                                 if (c.zip<minzip){
                                                                   minzip=c.zip;display[cityindex]=c;
                                                                 }
                                                               }
                                                             }
                                             else if (headerindex==1){float min=qualifiers.get(0).pop;
                                                               display[cityindex]=qualifiers.get(0);
                                                               for(City c : qualifiers){
                                                                 if (c.pop<min){
                                                                   min=c.pop;display[cityindex]=c;
                                                                 }
                                                               }
                                                             }
                                             else if (headerindex==2){float min=qualifiers.get(0).age;
                                                               display[cityindex]=qualifiers.get(0);
                                                               for(City c : qualifiers){
                                                                 if (c.age<min){
                                                                   min=c.age;display[cityindex]=c;
                                                                 }
                                                               }
                                                             }
                                             else if (headerindex==3){float min=qualifiers.get(0).male;
                                                               display[cityindex]=qualifiers.get(0);
                                                               for(City c : qualifiers){
                                                                 if (c.male<min){
                                                                   min=c.male;display[cityindex]=c;
                                                                 }
                                                               }
                                                             }
                                              else if (headerindex==4){float min=qualifiers.get(0).female;
                                                               display[cityindex]=qualifiers.get(0);
                                                               for(City c : qualifiers){
                                                                 if (c.female<min){
                                                                   min=c.female;display[cityindex]=c;
                                                                 }
                                                               }
                                                             }
                                               else if (headerindex==5){float min=qualifiers.get(0).households;
                                                               display[cityindex]=qualifiers.get(0);
                                                               for(City c : qualifiers){
                                                                 if (c.households<min){
                                                                   min=c.households;display[cityindex]=c;
                                                                 }
                                                               }
                                                             }
                                                else if (headerindex==6){float min=qualifiers.get(0).householdsize;
                                                               display[cityindex]=qualifiers.get(0);
                                                               for(City c : qualifiers){
                                                                 if (c.householdsize<min){
                                                                   min=c.householdsize;display[cityindex]=c;
                                                                 }
                                                               }
                                                             }
      
                                           }
                           else if (operatorindex==0){if (headerindex==0){float max=qualifiers.get(0).zip;
                                                               display[cityindex]=qualifiers.get(0);
                                                               for(City c : qualifiers){
                                                                 if (c.zip>max){
                                                                   max=c.zip;display[cityindex]=c;
                                                                 }
                                                               }
                                                             }
                                             else if (headerindex==1){float max=qualifiers.get(0).pop;
                                                               display[cityindex]=qualifiers.get(0);
                                                               for(City c : qualifiers){
                                                                 if (c.pop>max){
                                                                   max=c.pop;display[cityindex]=c;
                                                                 }
                                                               }
                                                             }
                                             else if (headerindex==2){float max=qualifiers.get(0).age;
                                                               display[cityindex]=qualifiers.get(0);
                                                               for(City c : qualifiers){
                                                                 if (c.age>max){
                                                                   max=c.age;display[cityindex]=c;
                                                                 }
                                                               }
                                                             }
                                             else if (headerindex==3){float max=qualifiers.get(0).male;
                                                               display[cityindex]=qualifiers.get(0);
                                                               for(City c : qualifiers){
                                                                 if (c.male>max){
                                                                   max=c.male;display[cityindex]=c;
                                                                 }
                                                               }
                                                             }
                                              else if (headerindex==4){float max=qualifiers.get(0).female;
                                                               display[cityindex]=qualifiers.get(0);
                                                               for(City c : qualifiers){
                                                                 if (c.female>max){
                                                                   max=c.female;display[cityindex]=c;
                                                                 }
                                                               }
                                                             }
                                               else if (headerindex==5){float max=qualifiers.get(0).households;
                                                               display[cityindex]=qualifiers.get(0);
                                                               for(City c : qualifiers){
                                                                 if (c.households>max){
                                                                   max=c.households;display[cityindex]=c;
                                                                 }
                                                               }
                                                             }
                                                else if (headerindex==6){float max=qualifiers.get(0).householdsize;
                                                               display[cityindex]=qualifiers.get(0);
                                                               for(City c : qualifiers){
                                                                 if (c.householdsize>max){
                                                                   max=c.householdsize;display[cityindex]=c;
                                                                 }
                                                               }
                                                             }
      
                                           }
                 
}
