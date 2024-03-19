class Boat { 
  int zj=0;
  float cd=80;
  Boat() {
  }

  void move() {
    if (zj==1)
    {
      cd+=5;
      if (cd>700){
        zj=-1;
      }
    } else if (zj==-1){
      cd-=8;
      if (cd<=80)
      {
        zj=0; 
        cd=80; //beck to original length
      }
    }
  }

  void display() {
    noFill();
    line(px+2, 114, px+2, 114+cd);
    image(hook, px, 110+cd);
  }
}
