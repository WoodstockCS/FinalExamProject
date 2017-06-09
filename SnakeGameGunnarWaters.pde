//Gamemode 0 = Startup Screen
//Gamemode 1 = Normal Difficulty
//Gamemode 2 = Death Screen
//Gamemode 3 = Easy Difficulty
//Gamemode 4 = Hard Difficulty
//Gamemode 5 = IMPOSSIBLE Difficulty * Press '5' to play, if you find this.

import processing.sound.*;
SoundFile file;
SoundFile file2;
SoundFile file3;
Snake s;
int scl = 20;
String status = "";
PVector food;
boolean gotFood;
boolean alive;
boolean playing;
int gamemode;
PImage img;
PImage img2;
PImage img3;
void setup() {
  size(600, 600);
  s = new Snake();
  alive = true;
  img = loadImage("spodermanface.png"); 
  img2 = loadImage("pizza.jpeg");
  img3 = loadImage("spoderman.jpeg");
  frameRate(10);
  setFoodLocation();
  file= new SoundFile(this, "pizza.mp3");
  file2= new SoundFile(this, "death.mp3");
  file3= new SoundFile(this, "ding.wav");

}

void draw() {
  println(gamemode);
  background(0);
  if (gamemode == 0) {
    background(211, 111, 200);
    textSize(32);
    text("SNAKE GAME", 215, 250);
    textSize(12);
    text("Press Space to Start", 250, 300); 
    text("Difficulty", 280, 15);
    text("'Press Key For Difficulty Level'", 230, 30);
    text("Beginner ('1')", 150, 50);
    text("Normal ('Space Bar')", 250, 50);
    text("Hard ('3')", 400, 50);

    if (key == '1') {
      gamemode = 3;
      frameRate(5);
    }
    
    if (key == '3') {
      gamemode = 4;
      frameRate(15);
    }
    
    if (key == '5') {
      gamemode = 5;
      frameRate(20);
    }
    
    if (key == ' ') {
      gamemode = 1;
    }
    
  } else if (gamemode == 1 || gamemode == 3 || gamemode == 4 || gamemode == 5) 

  {

    if (keyCode== UP)
      s.dir(0, -1);
    if (keyCode==DOWN)
      s.dir (0, 1);
    if (keyCode==LEFT)
      s.dir (-1, 0);
    if (keyCode==RIGHT)
      s.dir(1, 0);

    s.checkForPulse();
    s.update();
    s.show();

    gotFood = s.eat(food);

    if (gotFood == true){
      setFoodLocation();
      file3.play();
    }

    fill(255, 0, 100);
    image(img2, food.x, food.y, scl, scl);

    status = "Deliveries: " + s.total;

    text(status, 50, 50);
  }  

  if (alive==false) { 
    if(!playing){
    file2.play();
    playing=true;
    }
    background(211, 111, 200);
    textSize(45);
    text("GAME OVER", 185, 250);
    textSize(12);
    text("Press the r key to start over", 220, 300);
    if (keyPressed== true && key=='r') {
      gamemode=0;
      alive=true;
      println("r pressed");
      file2.stop();
    }
  }
}


void setFoodLocation() {
  int cols = width/scl;
  int rows = height/scl;
  food = new PVector(floor(random(cols)), floor(random(rows)));
  food.mult(scl);
}


class Snake {
  float x = 0;
  float y = 0;
  float xspeed = 1;
  float yspeed = 0;
  int total = 0;
  ArrayList<PVector> tail = new ArrayList<PVector>();

  Snake() {
  }

  boolean eat(PVector pos) {
    float d = dist(x, y, pos.x, pos.y);
    if (d < 1) {
      total++;
      return true;
    } else {
      return false;
    }
  }

  void dir(float x, float y) {
    xspeed = x;
    yspeed = y;
  }

  void checkForPulse() {
    for (int i = 0; i < tail.size(); i++) {
      PVector pos = tail.get(i);
      float d = dist(x, y, pos.x, pos.y);
      if (d < 1) {
        total = 0;
        alive = false; 
        file.stop();
        tail.clear();
      }
    }
  }

  void update() {
    if (total > 0) {
      if (total == tail.size() && !tail.isEmpty()) {
        tail.remove(0);
      }
      tail.add(new PVector(x, y));
    }

    x = x + xspeed*scl;
    y = y + yspeed*scl;

    x = constrain(x, 0, width-scl);
    y = constrain(y, 0, height-scl);
  }

  void show() {
    fill(255);
    for (PVector v : tail) {
      image(img3, v.x, v.y, scl, scl);
    }
    image(img, x, y, scl, scl);
  }

  int getTotal() {
    return total;
  }
}

void keyPressed(){
  if(keyCode== ' ' || keyCode== '1' || keyCode== '3' || keyCode== '4' || keyCode== '5'){
    file.loop();
   }
  //if(){
  //  file.stop();
  //  file.play();
 }//
  
//}