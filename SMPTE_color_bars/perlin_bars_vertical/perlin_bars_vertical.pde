float yoff = 0.0;        // 2nd dimension of perlin noise

void setup() {
  size(640, 360);
}

void draw() {
  background(255);
  noStroke();
  poly(400, 500, 0, 50, #FFCC00); //yellow
  poly(200, 300, 50, 100, #0000FF); //blue
  poly(100, 200, 100, 200, #F00000); //red
  poly(100, 200, 200, 300, #00FF00); //green
}

void poly(int xstart, int xend,int ystart,int yend, color fillcolor) {
  fill(fillcolor);
  // We are going to draw a polygon out of the wave points
  beginShape(); 
  
  float xoff = 0;       // Option #1: 2D Noise
  
  // Iterate over vertical pixels
  for (float y = ystart; y <= yend; y += 10) {
    // Calculate x value according to noise, map to 
    float x = map(noise(yoff, xoff), 0, 1, xstart, xend);
    
    // Set the vertex
    vertex(x, y); 
    // Increment y dimension for noise
    yoff += 0.035;
  }
  // increment x dimension for noise
  xoff += 0.01;
  vertex(width, yend);
  vertex(width, ystart);
  endShape(CLOSE);
}
