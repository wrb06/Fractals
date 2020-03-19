 import peasy.*;
import processing.opengl.*;

boolean redraw = true;
int squareSize = 1000;
double centerX = 0;
double centerY = 0;
double imageWidth = 1;
int pixelSize = 8;
int maxLoops = 50;
int n = 2;
Complex c = new Complex (-0.723, -0.2);

PeasyCam cam;
PMatrix3D currCameraMatrix;
PGraphics3D g3;  
  
int[][] heights = new int[1001][1001];
void setup(){  
  size(1000, 1000, OPENGL);
  
  g3 = (PGraphics3D)g;
  cam = new PeasyCam(this, 100); 
  background(255);
  noStroke();
  fill(0);
  translate(squareSize/2, squareSize/2, 1); 
}

void reCalc(){
  int intx = 0;
  int inty = 0;
  for (double x = centerX-imageWidth; x < centerX+imageWidth; x+= 2*pixelSize * imageWidth/squareSize) {
    for (double y = centerY-imageWidth; y < centerY+imageWidth; y+=2*pixelSize * imageWidth/squareSize) {
      // Uncomment for mandelbrot set
      //c = new Complex (x, y);
      Complex zn = new Complex (x, y);
      int i = 0;
      while (i < maxLoops && zn.length2() < 100){

        zn = zn.powerN(n).addComp(c);
        
        i++;
      }
      heights[intx][inty] = i;
      inty++;
    }
    inty = 0;
    intx++;
  }
}

void redrawFract(){
  int intx = 0;
  int inty = 0;

  for (double x = centerX-imageWidth; x < centerX+imageWidth; x+= 2*pixelSize * imageWidth/squareSize) {
    for (double y = centerY-imageWidth; y < centerY+imageWidth; y+=2*pixelSize * imageWidth/squareSize) {
      
      
      fill(
        55 + 100*cos((1*PI)/(3) + (TWO_PI*(float)heights[intx][inty])/(maxLoops)),
        55 + 100*cos((PI*(float)heights[intx][inty])/(maxLoops)),
        55 + 100*cos((2*PI)/(3) + (TWO_PI*(float)heights[intx][inty])/(maxLoops))
      );
      
      translate(
        (float)((((x-centerX)/(2*imageWidth))+0.5)*squareSize), 
        (float)((((y-centerY)/(2*imageWidth))+0.5)*squareSize),
        (100.0f * heights[intx][inty])/(maxLoops)
      );
      
      box(pixelSize, pixelSize, 200-(200.0f * heights[intx][inty])/(maxLoops));
      
      translate(
        -((float)((((x-centerX)/(2*imageWidth))+0.5)*squareSize)), 
        -((float)((((y-centerY)/(2*imageWidth))+0.5)*squareSize)),
        -(100.0f * heights[intx][inty])/(maxLoops)
      );
      
      inty++;
    }
    inty = 0;
    intx++;
  }
  
}


void keyPressed(){
  if (key == 'd'){
    centerX += 0.1*imageWidth;
    redraw = true;
  }
  if (key == 'a'){
    centerX -= 0.1*imageWidth;
    redraw = true;
  }
  if (key == 's'){
    centerY += 0.1*imageWidth;
    redraw = true;
  }
  if (key == 'w'){
    centerY -= 0.1*imageWidth;
    redraw = true;
  }
  
  if (key == '1'){
    pixelSize = 1;
    redraw = true;;
  }
    if (key == '2'){
    pixelSize = 2;
    redraw = true;
  }
    if (key == '3'){
    pixelSize = 4;
    redraw = true;;
  }
    if (key == '4'){
    pixelSize = 8;
    redraw = true;
  }
  if (keyCode == UP){
    c = new Complex(c.Rel, c.Img-0.01);
    redraw = true;
  }
    if (keyCode == DOWN){
    c = new Complex(c.Rel, c.Img+0.01);
    redraw = true;
  }
  if (keyCode == LEFT){
    c = new Complex(c.Rel-0.01, c.Img);
    redraw = true;
  }
  if (keyCode == RIGHT){
    c = new Complex(c.Rel+0.01, c.Img);
    redraw = true;
  }
  if (key == ']'){
    imageWidth *= 2;
    redraw = true;
  }
  if (key == '['){
    imageWidth /=2;
    redraw = true;
  }
    
}

 

void draw(){
  //directionalLight(255, 255, 255, 0.8, 0.8, 0.8);
  translate(-squareSize/2, -squareSize/2, 1); 
  background(255);
  redrawFract();
  if (redraw){
    redraw = false;
    reCalc();
    print("c is:" + c.Rel + ' '+ c.Img + "\n");
  }
}
