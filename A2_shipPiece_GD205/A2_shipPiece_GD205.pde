Bullet b;

int chargeTime = millis();

void setup(){
  size(666, 666);
  background(255);
  b = new Bullet (333, 666, "main");
}

void draw(){
  b.display();
  b.update();
  
}
