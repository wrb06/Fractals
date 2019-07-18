class Complex{
  public double Rel, Img = 0;
  
  public Complex(double rel, double img){
    Rel = rel;
    Img = img;
  }
  
  public Complex addComp(Complex num){
    return new Complex(Rel + num.Rel, Img + num.Img);
  }
  public Complex multComp(Complex num){
     return new Complex(Rel*num.Rel - Img*num.Img, Img*num.Rel + Rel*num.Img); 
  }
  public double length2(){
    return Rel*Rel + Img*Img; 
  }
  public Complex powerN(int n){
    // zn = z^n
    Complex zn = this;
    for (int j = 1; j<n; j++){
      zn = zn.multComp(this);
    }
    return zn;
  }
  
  
}
