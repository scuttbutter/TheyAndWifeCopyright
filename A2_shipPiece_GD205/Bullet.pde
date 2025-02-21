class Bullet{
  
  PVector posB;
  PVector speedB = new PVector();
  color c;
  int sizeB;
  
  Bullet(float x, float y, String type){
    posB = new PVector(x, y);
    
    // switch statement that creates the difference between both types of fire
    switch(type){
      case "alt":
        speedB = new PVector(0.0, -6.0);
        c = #B25107;
        sizeB = 50;
        break;
      case "main":
        speedB = new PVector(0.0, -5.0);
        c = #3BF552;
        sizeB = 30;
        break;
    }
  }
  
  // spawns the bulet 
  void display(){
    fill(c);
    noStroke();
    circle(posB.x, posB.y, sizeB);
  }
  
  void update(){
    posB.add(speedB);
  }
}
