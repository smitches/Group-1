ArrayList<Listing> nytListings; 
ArrayList<Listing> nytListings2; 
ArrayList<Listing> nytListings3; 
ArrayList<Listing> nytListings4; 
ArrayList<Listing> nytListings5; 
PImage nytimes; 

PreviousButton pb; 
NextButton nb; 


void setup(){
  size(640, 800);
  nytimes = loadImage("nytimes.png"); 
 
 //buttons
 pb = new PreviousButton(50,60,100,50); 
 nb = new NextButton(500,60,100,50); 

  //XML
  XML root = loadXML("Travel.xml");
  XML[] listings = root.getChild("channel").getChildren("item");
  nytListings = new ArrayList<Listing>();
  for(XML n: listings){
    String t = n.getChild("title").getContent(); 
    String l = n.getChild("link").getContent(); 
    String d = n.getChild("description").getContent(); 
    
    Listing listing = new Listing(t, l, d);
    nytListings.add(listing);   
  }
  
  XML root2 = loadXML("Arts.xml");
  XML[] listings2 = root2.getChild("channel").getChildren("item");
  nytListings2 = new ArrayList<Listing>();
  for(XML n: listings2){
    String t = n.getChild("title").getContent(); 
    String l = n.getChild("link").getContent(); 
    String d = n.getChild("description").getContent(); 
    
    Listing listing = new Listing(t, l, d);
    nytListings2.add(listing);   
  }
  XML root3 = loadXML("Fashion.xml");
  XML[] listings3 = root3.getChild("channel").getChildren("item");
  nytListings3 = new ArrayList<Listing>();
  for(XML n: listings3){
    String t = n.getChild("title").getContent(); 
    String l = n.getChild("link").getContent(); 
    String d = n.getChild("description").getContent(); 
    
    Listing listing = new Listing(t, l, d);
    nytListings3.add(listing);   
  }
  XML root4 = loadXML("Health.xml");
  XML[] listings4 = root4.getChild("channel").getChildren("item");
  nytListings4 = new ArrayList<Listing>();
  for(XML n: listings4){
    String t = n.getChild("title").getContent(); 
    String l = n.getChild("link").getContent(); 
    String d = n.getChild("description").getContent(); 
    
    Listing listing = new Listing(t, l, d);
    nytListings4.add(listing);   
  }
  XML root5 = loadXML("Sports.xml");
  XML[] listings5 = root5.getChild("channel").getChildren("item");
  nytListings5 = new ArrayList<Listing>();
  for(XML n: listings5){
    String t = n.getChild("title").getContent(); 
    String l = n.getChild("link").getContent(); 
    String d = n.getChild("description").getContent(); 
    
    Listing listing = new Listing(t, l, d);
    nytListings5.add(listing);   
  }
}


void draw(){
  //do background here
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
  
  fill(47,196,57); 
  text("Travel", 30, 500); 
  
  fill(196,124,47);
  text("Arts", 170, 500); 
  
  fill(191,47,196);
  text("Fashion", 280, 500); 
  
  fill(47,134,196);
  text("Health", 440, 500);
  
  fill(196,69,47);
  text("Sports", 570, 500);
  
  
  
  //nytListings.get(0).display(); 
  //nytListings2.get(1).display(); 
  
  
}