import processing.sound.*;
SoundFile bgm;

//images 
PImage[] fishImages;
PImage bg;
PImage cat;
PImage fish1;
PImage fish2;
PImage fish3;
PImage fish4;
PImage fish5;
PImage fish6;
PImage pow;
PImage hook;

float px=200;
int state=0;
//=======================
int score=0; //current score
int plife=3; //life
ArrayList<Fish> balls;
ArrayList<Boat> myboat;
ArrayList<Pow> pows;
void setup() {
  size(1200, 800);
  imageMode(CENTER);
  stroke(0);
  
   //bgm
   bgm = new SoundFile(this, "bgm.mp3");
   bgm.loop();
    
  bg = loadImage("background.png"); 
  
  cat = loadImage("su.png"); 

  fish1 = loadImage("catfood1.png"); 
  fish2 = loadImage("catfood2.png"); 
  fish3 = loadImage("catfood3.png"); 
  fish4 = loadImage("catfood4.png"); 
  fish5 = loadImage("catfood5.png"); 
  fish6 = loadImage("catfood6.png"); 
  fishImages = new PImage[]{fish1, fish2, fish3, fish4, fish5, fish6};
  pow = loadImage("pow.png"); 
  hook = loadImage("hook.png"); 

  balls = new ArrayList<Fish>();
  myboat = new ArrayList<Boat>();
  pows = new ArrayList<Pow>();
  
  myboat.add(new Boat());
  balls.add(new Fish(fishImages, 250, 1));
  balls.add(new Fish(fishImages, 300, -1));
  balls.add(new Fish(fishImages, 400, 1));
  balls.add(new Fish(fishImages, 500, -1));
  balls.add(new Fish(fishImages, 600, 1));
  balls.add(new Fish(fishImages, 700, -1));
  pows.add(new Pow(pow, 650, 1));
  pows.add(new Pow(pow, 550, 1));
  pows.add(new Pow(pow, 450, -1));
  pows.add(new Pow(pow, 550, -1));
  pows.add(new Pow(pow, 350, 1));
}

void draw() {
  if (state==0)
  {
    background(255, 215, 237);
    image(bg, width/2, height/2);
    image(cat, px+cat.width/2, 110+cat.height/2);

    for (int i = myboat.size()-1; i >= 0; i--) { 
      Boat c = myboat.get(i);
      c.move();
      c.display();
    }

    for (int i = balls.size()-1; i >= 0; i--) { 
      Fish ball = balls.get(i);
      ball.move();
      ball.display();
      if (ball.finished()) {
        balls.remove(i);
      }
    }
    
        for (int i = pows.size()-1; i >= 0; i--) { 
      Pow pow = pows.get(i);
      pow.move();
      pow.display();
      if (pow.finished()) {
        pows.remove(i);
      }
    }
    
    fill(0);
    textSize(30);
    text("Score:"+score, width-150, 50);
    text("Life:"+plife, width-150, 90);
  } else
  {
    background(255, 215, 237);
    textAlign(CENTER, CENTER);
    textSize(30);
    text("GAMEOVER\n", width/2, height/2);
    text("\nYour score: "+score, width/2, height/2);
  }
}

void keyPressed() {
  if (keyCode==LEFT)
    px-=10;
  if (keyCode==RIGHT)
    px+=10;
  if (keyCode==' ')
    myboat.get(0).zj=1;
  if (key == 'e') 
    // Manually end the game
    state = 1;
}
