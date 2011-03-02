// All Examples Written by Casey Reas and Ben Fry
// unless otherwise stated.
// The statements in the setup() function 
// execute once when the program begins

float time = 0;
float spacing = 50;
PFont font = createFont("MyriadPro-BoldCond",48);
Series[] series_array;

void setup() 
{
  size(1000,800);  // Size should be the first statement
  frameRate(30);
	background(30);
	
	series_array = new Series[50];
	
	for(int i = 0; i < 50; i++) {
		series_array[i] = new Series(1);
	}
	
}

void draw() 
{
	time = time + 1;
	
	background(50);
	
	for(int i = 0; i < 50; i++) {
		series = series_array[i];
		series.count = series.count + random(0, 1);
		if(series.count > 50) {
			noLoop();
		}
		series.move(0, i * 17);
		series.render();
	}
	
	fill(255);
	textFont(font);
	text(frameRate, 20, 45);
}

class Series {
	float x;
	float y;
	int count;
	float spacing = 2;
	Led[] leds;
	
	Series(int count) {
		this.count = count;
	}
	
	void move(float x, float y) {
		this.x = x;
		this.y = y;
	}
	
	void render() {
		for(int i = 0; i < this.count; i++) {
			led = new Led();
			led.move((i * (this.spacing + led.size)) + this.x, this.y);
			led.render();
		}
	}
}

class Led {
	
	float x;
	float y;
	float size = 15;
	
	Led() {
	}
	
	void move(float x, float y) {
		this.x = x;
		this.y = y;
	}
	
	void render() {
		noStroke();
		fill(color(255, 0, 0));
		rect(this.x, this.y, this.size, this.size);
	}
	
}

int dist(p1, p2) {
	float dx = p2.x - p1.x;
	float dy = p2.y - p1.y;
	return sqrt(dx * dx + dy * dy);
}