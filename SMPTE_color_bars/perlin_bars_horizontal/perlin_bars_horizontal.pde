float yoff = 0.0;        // 2nd dimension of perlin noise

void setup() {
  size(640, 360);
}

void draw() {
  background(51);

  fill(255);
  // We are going to draw a polygon out of the wave points
  poly(-150);
  poly(-100);
  //poly(-10);
  //poly(10);
  poly(50);
  poly0(50);
  
}
  
void poly(float delta) {
    beginShape();
    float xoff = 0.0;
    fill(10+int(delta));
    // Iterate over horizontal pixels
    for (float x = 10; x <= width; x += 10) {
      // Calculate a y value according to noise, map to 
      float y = map(noise(xoff, yoff), 0, 1, 200,360); // Option #1: 2D Noise
      
      // Set the vertex
      vertex(x, y + delta);
      // Increment x dimension for noise
      xoff += 0.05;
    }
    // increment y dimension for noise
    yoff += 0.01;
    vertex(width, height);
    
    vertex(10, height);
    endShape(CLOSE);
}
void poly0(float delta) {
    beginShape();
    float xoff = 0.0;
    fill(#FF0000);
    // Iterate over horizontal pixels
    for (float x = 0; x <= 10; x += 10) {
      // Calculate a y value according to noise, map to 
      float y = map(noise(xoff, yoff), 0, 1, 200,360); // Option #1: 2D Noise
      
      // Set the vertex
      vertex(x, y + delta);
      // Increment x dimension for noise
      xoff += 0.05;
    }
    // increment y dimension for noise
    yoff += 0.001;
    vertex(10, height);
    
    vertex(0, height);
    endShape(CLOSE);
}
