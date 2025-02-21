class Enemy {
  PVector posE;
  PVector sizeE;
  PVector HoriSpeedE = new PVector();
  
  Enemy(float x, float y, float c, float d){
    posE = new PVector(x, y);
    sizeE = new PVector(c, d);
    HoriSpeedE = new PVector(75.0, 0.0 );
  }
  
  void display(){
    rect(posE.x, posE.y, sizeE.x, sizeE.y);
  }
  
}
