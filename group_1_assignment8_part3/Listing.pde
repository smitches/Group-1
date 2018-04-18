class Listing{
  String title;
  String link;
  String description;
  String category; 
  
  Listing(String t, String l, String d, String c){
    this.title= t;
    this.link = l;
    this.description = d;
    this.category = c;
  }
  
  void display(int y){
    textSize(15);
    ///CHANGE HEADLINE COLOR BASED ON CATEGORY
    if(category=="travel"){
    }
    text(title, 10, y);
    if (mouseY > y - 10 && mouseY < y + 10){
      fill(255); 
      rect(10, y+20, 500, 70); 
      fill(0); 
      text(description, 10, y + 20, 500,70 );
      
    }
    if(mousePressed){
      if (mouseY > y - 10 && mouseY < y + 10){
        link(link);
      }
    }
  }
}
