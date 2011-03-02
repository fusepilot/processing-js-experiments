// All Examples Written by Casey Reas and Ben Fry
// unless otherwise stated.
// The statements in the setup() function 
// execute once when the program begins

float time = 0;
Circle[] circles;
int numCircles = 0;
PFont font = createFont("MyriadPro-BoldCond",48);

void setup() 
{
  size(800,600);  // Size should be the first statement
  frameRate(30);
  background(30);
  
  circles = new Circle[0];
}

void draw() 
{
  noStroke();
  fill(30);
  rect(0,0, 150, 200);
  fill(255);
  textFont(font);
  text(frameRate, 20, 45);
  text(numCircles, 20, 80);
  
  for(int i = 0; i < circles.length; i++) {
    circle = circles[i];
    circle.size = circle.size + 1;
    circle.render();
  }
}

void addCircle()
{
  circle = new Circle(random(0, 800), random(0, 600));
  circle.render();
  
  circles[numCircles] = circle;
  numCircles++;
}

class Circle 
{
  float x;
  float y;
  float size = 50;
  
  Circle(float x, float y) 
  {
    this.x = x;
    this.y = y;
  }
  
  void render() 
  {
    stroke(255);
    fill(color(100, 100, 100));
    ellipse(this.x, this.y, this.size, this.size);
  }
  
}