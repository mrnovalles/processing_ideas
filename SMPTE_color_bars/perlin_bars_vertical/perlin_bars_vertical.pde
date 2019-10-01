float yoff = 0.0;        // 2nd dimension of perlin noise

void setup(){
  size(1024, 768);
  background(0);
  noStroke();
}

int top_bar_amount = 7;
color black = #000000;
color[] top_colors = {
  #c1c1c1, #c0c000, #00c0c0, #00c000, #c000c0, #c00000, #0000c0 
};
color[] lower_colors = {
  #00214c, #ffffff, #32006a, #090909, #000000, #090909, #1d1d1d
};

void draw() {
  float top_height = 0.66667 * height;
  float mid_height = 0.08334 * height;
  float lower_height = 0.25 * height;
  float one_seventh_w = width / top_bar_amount;
   
  for(int i=0; i < top_bar_amount; i++){
    poly(i * one_seventh_w, 0, one_seventh_w, top_height, top_colors[i % top_bar_amount]);
  }
  
  color mid_color;
  for(int j = 0; j < top_bar_amount; j++){
    mid_color = #000000;
    if (j % 2 == 0) {
      mid_color = top_colors[(top_colors.length - 1 - j) % top_bar_amount];
    }
    poly(j * one_seventh_w, top_height, one_seventh_w, mid_height, mid_color);
  }
  // For the lower rows we need 4 bars occupying as much as 5 bars 
  // from top and middle row
  int intial_lower_bar_amount = 4;
  float lower_bars_w = (5 * one_seventh_w) / intial_lower_bar_amount;
  for (int k=0; k < intial_lower_bar_amount; k++) {
    poly(k * lower_bars_w, height - lower_height, lower_bars_w, lower_height, lower_colors[k]);
  }
  
  // And 3 thin bars occupying 1 bar from top and middle row
  int thin_lower_bar_amount = 3;
  float thin_lower_bar_width = one_seventh_w / thin_lower_bar_amount;
  for (int l=0; l < thin_lower_bar_amount; l++) {
    poly(intial_lower_bar_amount * lower_bars_w + (l * thin_lower_bar_width), height - lower_height, thin_lower_bar_width, lower_height, lower_colors[intial_lower_bar_amount + l]);
  }
}

void poly(float xstart, float ystart, float xwidth, float yheight, color fillcolor) {
  fill(fillcolor);
  // We are going to draw a polygon out of the wave points
  beginShape(); 
  float xoff = 0;       // Option #1: 2D Noise
 
  // Iterate over vertical pixels
  for (float y = ystart; y <= ystart + yheight; y += 10) {
    // Calculate x value according to noise, map to 
    float x = map(noise(yoff, xoff), 0, 1, xstart, xstart + xwidth);
    
    // Set the vertex
    vertex(x, y); 
    // Increment y dimension for noise
    yoff += 0.035;
  }
  // increment x dimension for noise only if not in the first bar
  xoff += 0.8;
  vertex(width, ystart+yheight);
  vertex(width, ystart);
  endShape(CLOSE);
}
