class Pow { 
  float x;
  float y;
  float speed=5;
  int fx=0;

  float life = 255;
  PImage image;
  boolean m =false;
  int fish_score;
  Pow(PImage image_, float y_, int fx_) {
    image = image_;
    x=random(width);
    y = y_;
    fx=fx_;
    fish_score=(int)random(10, 20);
  }

  void move() {
    if (!m)
      x = x + speed*fx;
    else
    {
      x = px;
      y=110+myboat.get(0).cd;
      if (myboat.get(0).cd==80)
      {
        life=-1;
        pows.add(new Pow(pow, random(200, 700), 1));
        plife--;
        if (plife==0)
          state=-1;
      }
    }

    if (x > width+40) {
      x = -40;
    }
    if (x<-40)
      x=width+40;

    if (dist(px, 110+myboat.get(0).cd, x, y)<30)
    {
      m=true;
      myboat.get(0).zj=-1;
    }
  }
  boolean finished() {
    if (life < 0) {
      return true;
    } else {
      return false;
    }
  }

  void display() {
    image(image, x, y);
  }
}  
