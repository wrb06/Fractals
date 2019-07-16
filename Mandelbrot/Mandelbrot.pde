boolean redraw = true;
int squareSize = 1000;
double centerX = 0;
double centerY = 0;
double imageWidth = 1;
int pixelSize = 6;
int maxLoops = 400;
  
  
void setup(){
  size(1000, 1000);
  background(255);
  noStroke();
  fill(0);
}

void redrawFract(){
  for (double x = centerX-imageWidth; x < centerX+imageWidth; x+= 2*pixelSize * imageWidth/squareSize) {
    for (double y = centerY-imageWidth; y < centerY+imageWidth; y+=2*pixelSize * imageWidth/squareSize) {
      Complex z0 = new Complex (x, y);
      Complex zn = new Complex (x, y);
      int i = 0;
      while (i < maxLoops && zn.length2() < 100){
        zn = (zn.multComp(zn)).addComp(z0);
        
        i++;
      }
      fill(255 - (i*255)/maxLoops, 255 - (i*255)/maxLoops, 255);
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
    pixelSize = 3;
    redraw = true;;
  }
    if (key == '4'){
    pixelSize = 4;
    redraw = true;
  }
    if (key == '5'){
    pixelSize = 5;
    redraw = true;;
  }
    if (key == '6'){
    pixelSize = 6;
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
  }
}
