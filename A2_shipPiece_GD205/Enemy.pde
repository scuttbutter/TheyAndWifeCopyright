//  embeds the enemyModel class in the enemy 
class Enemy extends enemyModel {
  PVector posE;
  PVector sizeE;
  PVector VertSpeedE = new PVector();
  float rightE;
  float leftE;
  float topE;
  float botE;
  
  boolean pleaseDie;
  boolean allDead;
  
  Enemy(float x, float y, float c, float d){
    posE = new PVector(x, y);
    sizeE = new PVector(c, d);
    VertSpeedE = new PVector(0.0, 75.0);
    
    rightE = x + c/2;
    leftE = x - c/2;
    topE = y - d/2;
    botE = y + d/2;
    
    pleaseDie = false;
    allDead = false;
  }
  
  void display(){
    colour();
    rect(posE.x, posE.y, sizeE.x, sizeE.y);
  }
  
  // makes the enemies move every 2 seconds
  void update(){
    if(frameCount % 120 == 0){
      posE.add(VertSpeedE);
      rightE = posE.x + sizeE.x/2;
      leftE = posE.x - sizeE.x/2;
      topE = posE.y - sizeE.y/2;
      botE = posE.y + sizeE.y/2;
    }
  }
}
