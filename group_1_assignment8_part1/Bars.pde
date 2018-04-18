class Bars {
  ArrayList<IntList> Entries;
  Slider EyeSlider, SexSlider;
  IntList Males = new IntList(0,1,2,3);
  IntList Females = new IntList(4,5,6,7);
  IntList gender;
  IntList selected;
  Float increment = 4.67142857143;

  Bars(ArrayList<IntList> entries, Slider slider1, Slider slider2){
   Entries = entries;
   EyeSlider = slider1;
   SexSlider = slider2;
    
  }
  
  void updateSex(){
    if (SexSlider.getPer() < 0.5){
      gender = Males;
    }else {
      gender = Females;}
  }
  
  void update(){
    updateSex();
    if (EyeSlider.getPer() < 0.25){
      selected = Entries.get(gender.get(0));
    }else if (0.25 <= EyeSlider.getPer() && EyeSlider.getPer() < 0.5){
      selected = Entries.get(gender.get(1));
    }else if (0.5 <= EyeSlider.getPer() && EyeSlider.getPer() < 0.75){
      selected = Entries.get(gender.get(2));
    }else if(0.75 <= EyeSlider.getPer() && EyeSlider.getPer() <= 1) {
      selected = Entries.get(gender.get(3));
    }
  
     //Black
     fill(#0A0204);
     float y1 = selected.get(0) * increment;
     rect(142,400-y1,50, y1);
     fill(0,0,0);
     text(selected.get(0), 142+13, 400-y1-10);
    
     //Brown
     fill(#814944);
     float y2 = selected.get(1) * increment;
     rect(245,400-y2,50,y2);
     fill(0,0,0);
     text(selected.get(1), 245+13, 400-y2-10);
    
     //Red
     fill(#9D0B1C);
     float y3 = selected.get(2) * increment;
     rect(340,400-y3,50,y3);
     fill(0,0,0);
     text(selected.get(2), 340+13, 400-y3-10);
     
     
     //Blonde
     fill(#FBFFBF);
     float y4 = selected.get(3) * increment;
     rect(440,400-y4,50,y4);
     fill(0,0,0);
     text(selected.get(3), 440+16, 400-y4-10);
    
       
  }
  
  void display(){
    
    //Eye Color Label
    line(625,145,743,145);
    line(625,140,625,150);
    line(654.5,140,654.5,150);
    line(684,140,684,150);
    line(713.5,140,713.5,150);
    line(743,140,743,150);
    
    //Gender Label
    line(625,295,685,295);
    line(625,290,625,300);
    line(655,290,655,300);
    line(685,290,685,300);
    

    
    }
}