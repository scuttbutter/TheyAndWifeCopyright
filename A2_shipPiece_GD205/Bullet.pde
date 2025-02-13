public Class Bullet;
  
  PVector posB;
  PVector speedB;
  color c;
  int size;
  
  Bullet(float x, float y, String type){
    posB = new PVector(x, y);
    
    switch(type){
      case "main":
        speedB = new PVector(0.0, 0.7);
        
