Bullet b;

int chargeTime = millis();

void setup(){
  size(666, 666);
  background(255);
  b = new Bullet (999, 999, "type");
}

void draw(){
  b.display();
  b.update();
  
}

void keyPressed(){
  if(key == ' '){
    b = new Bullet(333, 333, "main");
  }
}
