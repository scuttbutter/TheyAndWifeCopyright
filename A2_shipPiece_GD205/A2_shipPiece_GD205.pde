Bullet b;

void setup(){
  size(666, 666);
  b = new Bullet (999, 999, "type");
}

void draw(){
  background(255);
  b.display();
  b.update();
  
}

void keyPressed(){
  if(key == ' '){
    b = new Bullet(333, 333, "main");
  }
}
