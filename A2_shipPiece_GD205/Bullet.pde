class Bullet{
  
  PVector posB;
  PVector speedB;
  color c;
  int size;
  
  Bullet(float x, float y, String type){
    posB = new PVector(x, y);
    
    // switch statement that creates the difference between both types of fire
    switch(type){
      case "alt":
        speedB = new PVector(0.0, -0.7);
        c = #B25107;
        size = 50;
        break;
      case "main":
        speedB = new PVector(0.0, -0.45);
        c = #3BF552;
        size = 30;
        break;
    }
  }
  
  // spawns the bulet 
  void display(){
    fill(c);
    noStroke();
    circle(posB.x, posB.y, size);
  }
  
  void update(){
    posB.add(speedB);
  }
}
        
        
        
