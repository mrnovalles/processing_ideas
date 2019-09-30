/* 
Code relying on code2pixels pantoneTests
available in https://github.com/SandroMiccoli/code2pixels/

The MIT License (MIT)

Copyright (c) 2015 Sandro Miccoli

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/

void setup() {
  size(1300, 2000);
  noLoop();
}

color[] pantone2016 = {
    #f7cac9, #f7786b, #91a8d0, #004d8c, #fbe337, 
    #98ddde, #9896a4, #dc443a, #b18f6a, #71cc51
  };
void draw() {
  smooth();
  background(pantone2016[int(random(pantone2016.length))]);
  int distance = 200;
  noStroke();
  
  for (int i=0; i < width; i++){
    if (i!=0) {
      translate(i + distance, 0);
    }
    for (int j=0; j < height; j+=120){
      fill(pantone2016[int(random(pantone2016.length))]);
      triangle(50, 0 + j, 200, 50 + j,50 ,100 + j);
      fill(pantone2016[int(random(pantone2016.length))]);
      triangle(200, 60 + j,200, 160 + j, 60, 110 + j);
    }
  }
}

void mousePressed(){
  redraw(); 
}
