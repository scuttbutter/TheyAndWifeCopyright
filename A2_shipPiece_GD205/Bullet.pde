  class Bullet{
  
  PVector posB;
  PVector speedB = new PVector();
  color c;
  int sizeB;
  
  // Hitbox for the bulleths
  float leftB;
  float rightB;
  float topB;
  float botB;
  
  Bullet(float x, float y, String type){
    posB = new PVector(x, y);
    
    // switch statement that creates the difference between both types of fire
    switch(type){
      case "alt":
        speedB = new PVector(0.0, -6.0);
        c = #1f7a5d;
        sizeB = 50;
        break;
      case "main":
        speedB = new PVector(0.0, -5.0);
        c = #3BF552;
        sizeB = 30;
        break;
    }
    
    // hitbox variables
    rightB = posB.x + sizeB/2.0;
    leftB = posB.x - sizeB/2.0;
    topB = posB.y - sizeB/2.0;
    botB = posB.y + sizeB/2.0;
  }
  
  // spawns the bulet 
  void display(){
    fill(c);
    noStroke();
    circle(posB.x, posB.y, sizeB);
  }
  
  
  void update(){
    posB.add(speedB);
    rightB = posB.x + sizeB/2.0;
    leftB = posB.x - sizeB/2.0;
    topB = posB.y - sizeB/2.0;
    botB = posB.y + sizeB/2.0;
  }
  
  void hitEnemy(Enemy e){
    // collision kills enemies
    if(topB <= e.botE &&
       botB >= e.topE &&
       leftB <= e.rightE &&
       rightB >= e.leftE){
         e.pleaseDie = true;
       }
       
  }
}
