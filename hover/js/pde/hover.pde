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
	leds = new Led[numX * numY];
	background(50);
	
	wave = new Wave();
	
	for(int j = 0; j < numX; j++) {
		for(int k = 0; k < numY; k++) {
			leds[j * k]= new Led(j * k, 50);
		}
	}
}

void draw() 
{
	time = time + 1;
	
	wave.move(mouseX, mouseY);
	
	background(50);
	
	for(int j = 0; j < numX; j++) {
		for(int k = 0; k < numY; k++) {
			led = leds[j * k];
			led.move(j * spacing, k * spacing + 80);
			led.size = map(constrain(dist(wave, led) * .03, 1, 5), 0, 5, 100, 2);
			led.render();
		}
	}
	
	fill(255);
	textFont(font);
	text(frameRate, 20, 45);
}

class Wave {
	float x;
	float y;
	
	Wave() {
		
	}
	
	void move(float x, float y) {
		this.x = x;
		this.y = y;
	}
}

class Led {
	
	int id;
	float x;
	float y;
	float size = 5;
	
	Led(int id, float radius) {
		this.id = id;
		this.radius = size;
	}
	
	void move(float x, float y) {
		this.x = x;
		this.y = y;
 	
	}
	
	void render() {
		noStroke();
		fill(color(255, 0, 0));
		ellipse(x, y, size, size);
	}
	
}

int dist(p1, p2) {
	float dx = p2.x - p1.x;
	float dy = p2.y - p1.y;
	return sqrt(dx * dx + dy * dy);
}