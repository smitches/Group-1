class Listing{
  String title;
  String link;
  String description;
  
  Listing(String t, String l, String d){
    this.title= t;
    this.link = l;
    this.description = d;
  }
  
  void display(){
    textSize(20);
    fill(0);
    text(title, 10,20);
    text(link, 10, 50);
    text(description, 10, 80);
  }
}