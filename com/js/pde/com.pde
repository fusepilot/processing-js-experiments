// All Examples Written by Casey Reas and Ben Fry
// unless otherwise stated.
// The statements in the setup() function 
// execute once when the program begins

float time = 0;
Circle[] circles;
int numCircles = 0;
int numLines = 0;
PFont font = createFont("MyriadPro-BoldCond",20);

void setup() 
{
  size(1000,600);  // Size should be the first statement
  frameRate(30);
  background(255);
  smooth();
  circles = new Circle[0];
  lines = new Line[0];
}

void draw() 
{
  background(255);
  noStroke();
  
  //position circles, lines
  for(int i = 0; i < circles.length; i++) {
    circle = circles[i];
    circle.x = circle.x + circle.sX;
    circle.y = circle.y + circle.sY;
  }
  
  //render circles on top
  for(int i = 0; i < circles.length; i++) {
    circle = circles[i];
    circle.render();
  }
  
  //render stats
  fill(30);
  rect(0,0, 100, 120);
  fill(255);
  textFont(font);
  text("fps: " + int(frameRate), 20, 30);
  text("circles: " + numCircles, 20, 60);
  text("lines: " + numLines, 20, 90);
}

void addCircle()
{
  circle = new Circle(random(0, 1000), random(0, 600));
  circle.sX = random(-.5, .5);
  circle.sY = random(-.5, .5);
  if(circle.x > 800) circle.sX *= -1;
  if(circle.y > 600) circle.sY *= -1;
  circle.render();
  
  for(int k = 0; k < circles.length; k++) {
    otherCircle = circles[k];
    
    loto = int(random(0, 3));
    if(loto == 0) {
      circle.circles[circle.circles.length] = otherCircle;
      numLines++;
    }
  }
  
  circles[numCircles] = circle;
  numCircles++;
}

class Point
{
  float x;
  float y;
  
  Point(float x, float y) 
  {
    this.x = x;
    this.y = y;
  }
}

class Line
{
  Point sP;
  Point eP;
  
  Line(Point sP, Point eP) 
  {
    this.sP = sP;
    this.eP = eP;
  }
  
  void render() {
    stroke(50);
    line(sP.x, sP.y, eP.x, eP.y);
  }
}

class Circle 
{
  float x;
  float y;
  float sX = 0;
  float sY = 0;
  float size = 10;
  
  Circle[] circles;
  
  Circle(float x, float y) 
  {
    this.x = x;
    this.y = y;
    
    circles = new Circle[0];
  }
  
  void render() 
  {
    for(int c = 0; c < this.circles.length; c++) {
      circle = this.circles[c];
      
      lne = new Line(new Point(this.x, this.y), new Point(circle.x, circle.y));
      lne.render();
    }
    
    fill(100);
    text(this.circles.length, this.x + 10, this.y + 6);
    
    noStroke();
    fill(color(243, 47, 93));
    ellipse(this.x, this.y, this.size, this.size);
    
  }
  
}