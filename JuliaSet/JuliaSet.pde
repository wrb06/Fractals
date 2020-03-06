boolean redraw = true;
int squareSize = 1000;
double centerX = 0;
double centerY = 0;
double imageWidth = 1;
int pixelSize = 8;
int maxLoops = 100;
int n = 2;
Complex c = new Complex (0, -0.8);
  
  
void setup(){  
  size(1000, 1000);
  background(255);
  noStroke();
  fill(0);
}

void redrawFract(){
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
      
      fill(128*cos((PI*(float)i)/(maxLoops)), 128*cos((4*PI)/(3) + (PI*(float)i)/(maxLoops)), 128*cos((2*PI)/(3) + (PI*(float)i)/(maxLoops)));
      
      rect((float)((((x-centerX)/(2*imageWidth))+0.5)*squareSize), (float)((((y-centerY)/(2*imageWidth))+0.5)*squareSize), pixelSize, pixelSize);
      
      
    }
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
    c = new Complex(c.Rel, c.Img-0.001);
    redraw = true;
  }
    if (keyCode == DOWN){
    c = new Complex(c.Rel, c.Img+0.001);
    redraw = true;
  }
  if (keyCode == LEFT){
    c = new Complex(c.Rel-0.001, c.Img);
    redraw = true;
  }
    if (keyCode == RIGHT){
    c = new Complex(c.Rel+0.001, c.Img);
    redraw = true;
  }
    
}

void mouseWheel(MouseEvent event){
  if (event.getCount()>0){
    imageWidth *= 2;
  }
   else{
     imageWidth /=2;
   }
  redraw = true;
}
  

void draw(){
  if (redraw){
    background(255);
    redrawFract(); 
    redraw = false;
    print("c is:" + c.Rel + ' '+ c.Img + "\n");
  }
}
