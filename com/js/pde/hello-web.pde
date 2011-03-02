// All Examples Written by Casey Reas and Ben Fry
// unless otherwise stated.
// The statements in the setup() function 
// execute once when the program begins

float time = 0;
int numX = 25;
int numY = 25;
Wave wave;
float spacing = 50;
Led[] leds;
PFont font = createFont("MyriadPro-BoldCond",48);

void setup() 
{
  size(1000,800);  // Size should be the first statement
  frameRate(30);
	background(30);
}

void draw() 
{
	
}

void addCircle()
{
  noStroke();
	fill(color(255, 0, 0));
	size = random(10, 50);
	ellipse(random(10, 500), random(10, 500), size, size);
}