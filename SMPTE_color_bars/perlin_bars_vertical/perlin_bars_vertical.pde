float yoff = 0.0;        // 2nd dimension of perlin noise

void setup() {
  size(640, 360);
}

void draw() {
  background(51);

  fill(255);
  // We are going to draw a polygon out of the wave points
  beginShape(); 
  
  float xoff = 0;       // Option #1: 2D Noise
  
  // Iterate over horizontal pixels
  for (float y = 10; y <= height; y += 10) {
    // Calculate a x value according to noise, map to 
    float x = map(noise(xoff, yoff), 0, 1, 100,200); // Option #1: 2D Noise
    
    // Set the vertex
    vertex(x, y); 
    // Increment y dimension for noise
    yoff += 0.05;
  }
  // increment x dimension for noise
  xoff += 0.01;
  vertex(width, height);
  vertex(width, 10);
  endShape(CLOSE);
  poly();
}

void poly() {
  background(51);

  fill(#FFF000);
  // We are going to draw a polygon out of the wave points
  beginShape(); 
  
  float xoff = 0;       // Option #1: 2D Noise
  
  // Iterate over horizontal pixels
  for (float y = 10; y <= height-10; y += 10) {
    // Calculate a x value according to noise, map to 
    float x = map(noise(xoff, yoff), 0, 1, 100,200); // Option #1: 2D Noise
    
    // Set the vertex
    vertex(x, y); 
    // Increment y dimension for noise
    yoff += 0.05;
  }
  // increment x dimension for noise
  xoff += 0.01;
  vertex(width, height-10);
  vertex(width, 10);
  endShape(CLOSE);
}
