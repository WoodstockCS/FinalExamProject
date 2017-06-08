# FinalExamProject
//Justin Kopf
// Press 1,2,3 to change colors
//FinalProj
int centerX = 500;
int centerY = 500;
int secHand = 250;
float x;
float y;
float angle;
int r=0;
int g=0;
int b=0;
int w=1;
int z=1;
int v=1;
int a=6;
int d=9;
int c=7;
int l=0;
int m=0;
int n=0;
void setup() {
  size(1000, 1000);
  background(0);
  stroke(255);
  strokeWeight(5);
}

void draw() {
  background(r, g, b);
  noFill();
  float quarterCircle = PI/2;

  fill(l,m,n);
  ellipse(width*.5, height*.5, 800, 800);  
  fill(0);
  rect(400, 450, 200, 100);

  strokeWeight(2);

  line(503, 135, 503, 165);
  line(512, 135, 512, 165);
  line(480, 135, 495, 165);
  line(480, 165, 495, 135);
  line(475, 135, 520, 135);
  line(475, 165, 520, 165);

  line(480, 835, 490, 865);
  line(490, 865, 500, 835);
  line(510, 835, 510, 865);
  line(475, 835, 520, 835);
  line(475, 865, 520, 865);

  line(135, 485, 135, 515);
  line(140, 485, 155, 515);
  line(140, 515, 155, 485);
  line(130, 485, 160, 485);
  line(130, 515, 160, 515);

  line(835, 485, 835, 515);
  line(842, 485, 842, 515);
  line(849, 485, 849, 515);
  line(830, 485, 854, 485);
  line(830, 515, 854, 515);
  int s = second();
  // used https://forum.processing.org/one/topic/analog-clock.html for help 
  angle = ((2 * PI/60) * second()) - quarterCircle;
  x = centerX + secHand * cos(angle);
  y = centerY + secHand * sin(angle);
  stroke(255); 
  line(centerX, centerY, x, y);
  line(500, 500, x, y);



  fill(0);
  rect(400, 450, 200, 100);

  // code borrowed from https://www.openprocessing.org/sketch/13601
  fill(255);
  textSize(55);
  textAlign(CENTER);
  frameRate(1);

  int m = minute();
  int h = hour();
  String t = h + ":" + nf(m, 2);

  text (t, 500, 520);
}
void keyPressed() {
  if (key == '1') {
    b=b+w;
    m=m+a;
    if (b>=255) {
      w=-1;
    }
    if (m>=255) {
      a=-6;
    }
    if (b<=0) {
      w=1;
    }
    if (m<=0) {
      a=6;
    }
  }
  if (key=='2') {
    r=r+z;
    l=l+d;

    if (r>=255) {
      z=-1;
    }
    if (l>=255) {
      d=-9;
    }
    if (r<=0) {
      z=1;
    }
    if (l<=0) {
      d=9;
    }
  }
  if (key=='3') {
    g=g+v;
    n=n+c;
      if (g>=255) {
      v=-1;
    }
    if (n>=255) {
      c=-7;
    }
    if (g<=0) {
      v=1;
    }
    if (n<=0) {
      c=7;
    }
  }
}
