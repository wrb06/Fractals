float x, y, xn, yn, t, u = 0.92;
boolean redraw = true;

void setup(){
  stroke(0, 30);
  size(1000, 1000);
  background(255);
}

void draw(){
  if (redraw){
    redraw = false;
    background(255);
    for (int l = 0; l<5000; l++){
      x = random(-10, 10);
      y = random(-10, 10);
      for (int i = 0; i<10; i++){
        t = 0.4 - (6)/(1+x*x+y*y);
        
        xn = 1 + u*(x*cos(t)-y*sin(t));
        yn = u*(x*sin(t)+y*cos(t));
        
        line(500 + 50*x, 500 + 50*y, 500 + 50*xn, 500 + 50*yn);
        
        x = xn;
        y = yn;    
      }
    }
  }
}

void keyPressed(){
  if (key == 'a'){
    u-=0.01;
    redraw = true;
  }
  if (key == 'd'){
    u+=0.01;
    redraw = true;
  } 
}
