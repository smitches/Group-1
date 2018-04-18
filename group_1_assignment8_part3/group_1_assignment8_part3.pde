ArrayList<Listing> nytListings; 
ArrayList<Listing> nytListings2; 
ArrayList<Listing> nytListings3; 
ArrayList<Listing> nytListings4; 
ArrayList<Listing> nytListings5;
ArrayList<Listing> current;
PImage nytimes; 
int currentPage = 0; 
ArrayList<ArrayList> divided; 
Boolean page1=true,page2=false,page3=false;


PreviousButton pb; 
NextButton nb; 
RadioButton rb; 


void setup(){
  size(640, 800);
  nytimes = loadImage("nytimes.png"); 
  
 //buttons
 pb = new PreviousButton(50,60,100,50); 
 nb = new NextButton(500,60,100,50); 
 rb = new RadioButton(); 
  //XML
  XML root = loadXML("Travel.xml");
  XML[] listings = root.getChild("channel").getChildren("item");
  nytListings = new ArrayList<Listing>();
  for(XML n: listings){
    String t = n.getChild("title").getContent(); 
    String l = n.getChild("link").getContent(); 
    String d = n.getChild("description").getContent(); 
    String c = "Travel";
    
    Listing listing = new Listing(t, l, d, c);
    nytListings.add(listing);   
  }
  
  XML root2 = loadXML("Arts.xml");
  XML[] listings2 = root2.getChild("channel").getChildren("item");
  nytListings2 = new ArrayList<Listing>();
  for(XML n: listings2){
    String t = n.getChild("title").getContent(); 
    String l = n.getChild("link").getContent(); 
    String d = n.getChild("description").getContent(); 
    String c = "Arts";
    
    Listing listing = new Listing(t, l, d,c);
    nytListings2.add(listing);   
  }
  XML root3 = loadXML("Fashion.xml");
  XML[] listings3 = root3.getChild("channel").getChildren("item");
  nytListings3 = new ArrayList<Listing>();
  for(XML n: listings3){
    String t = n.getChild("title").getContent(); 
    String l = n.getChild("link").getContent(); 
    String d = n.getChild("description").getContent(); 
    String c = "Fashion";
    
    Listing listing = new Listing(t, l, d,c);
    nytListings3.add(listing);   
  }
  XML root4 = loadXML("Health.xml");
  XML[] listings4 = root4.getChild("channel").getChildren("item");
  nytListings4 = new ArrayList<Listing>();
  for(XML n: listings4){
    String t = n.getChild("title").getContent(); 
    String l = n.getChild("link").getContent(); 
    String d = n.getChild("description").getContent(); 
    String c = "Health";
    
    Listing listing = new Listing(t, l, d,c);
    nytListings4.add(listing);   
  }
  XML root5 = loadXML("Sports.xml");
  XML[] listings5 = root5.getChild("channel").getChildren("item");
  nytListings5 = new ArrayList<Listing>();
  for(XML n: listings5){
    String t = n.getChild("title").getContent(); 
    String l = n.getChild("link").getContent(); 
    String d = n.getChild("description").getContent(); 
    String c = "Sports";
    
    Listing listing = new Listing(t, l, d,c);
    nytListings5.add(listing);   
  }
  
  current = nytListings;
}


void draw(){
  //do background here
  background(255); 
  image(nytimes, 0, 0); 
  textSize(32); 
  fill(31,70,224); 
  text("NYTimes RSS, 5 January 2018", 10, 30); 
  
  pb.display(); 
  fill(255); 
  textSize(20); 
  text("PREVIOUS", 54,90); 

  nb.display(); 
  fill(255); 
  textSize(20); 
  text("NEXT", 525,90); 
  color t=color(47,196,57);
  fill(47,196,57); 
  text("Travel", 30, 500); 
  color a=color(196,124,47);  
  fill(196,124,47);
  text("Arts", 170, 500); 
  color f=color(191,47,196);
  fill(191,47,196);
  text("Fashion", 280, 500); 
  color h=color(47,134,196);
  fill(47,134,196);
  text("Health", 440, 500);
  color s=color(196,69,47);
  fill(196,69,47);
  text("Sports", 570, 500);
  
  rb.display();
  
  //for loop
  
  if (current==nytListings){
    fill(t);
  }
  if (current==nytListings2){
    fill(a);
  }
  if (current==nytListings3){
    fill(f);
  }
  if (current==nytListings4){
    fill(h);
  }
  if (current==nytListings5){
    fill(s);
  }
  //fill(current color)
  if (page1){
    current.get(0).display(520); 
    current.get(1).display(630); 
    current.get(2).display(735);
  }
  else if (page2){
    current.get(3).display(520);
    current.get(4).display(630);
    current.get(5).display(735);
  }
  else if(page3){
    current.get(6).display(520);
    current.get(7).display(630);
    current.get(8).display(735);
  }
  //println(nytListings.size());
  //nytListings2.get(1).display(600);
  loop();
}
/*
void reset(){
  currentidx = 0; 
  
  
}*/

void mouseClicked(){
  if (nb.over()){
    if (page1){
      page1=false;
      page2=true;
    }
    else if (page2){
      page2=false;
      page3=true;
    }
    else if (page3){
      page3=false;
      page1=true;
    }
  }
  if (pb.over()){
    if (page1){
      page1=false;
      page3=true;
    }
    else if (page2){
      page2=false;
      page1=true;
    }
    else if (page3){
      page3=false;
      page2=true;
    }

  }
}
void mousePressed(){
  //mouseX, mouseY
  if(dist(mouseX, mouseY, 15, 495) <=10){
    rb.setCurrent(0);
    current=nytListings;
    //current = nytListings; reset(); 
  }
  else if(dist(mouseX, mouseY, 150, 495) <=10){
    rb.setCurrent(1);
    current=nytListings2;
    //current = nytListings2;
  }
  else if(dist(mouseX, mouseY, 260, 495) <=10){
    rb.setCurrent(2);
    current=nytListings3;
  }
  else if(dist(mouseX, mouseY, 420, 495) <=10){
    rb.setCurrent(3);
    current=nytListings4;
  }
  else if(dist(mouseX, mouseY, 550, 495) <=10){
    rb.setCurrent(4);
    current=nytListings5;
  }
  //reset listings
  
  //println(rb.getCurrent());
  /*
  if (currentPage == 0){
    
  }*/
}
