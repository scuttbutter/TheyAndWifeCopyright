class Enemy extends enemyModel {
  PVector posE;
  PVector sizeE;
  PVector VertSpeedE = new PVector();
  
  Enemy(float x, float y, float c, float d){
    posE = new PVector(x, y);
    sizeE = new PVector(c, d);
    VertSpeedE = new PVector(0.0, 75.0);
    
  }
  
  void display(){
    colour();
    rect(posE.x, posE.y, sizeE.x, sizeE.y);
  }
  void update(){
    if(frameCount % 120 == 0){
      posE.add(VertSpeedE);
    }
  }
}
