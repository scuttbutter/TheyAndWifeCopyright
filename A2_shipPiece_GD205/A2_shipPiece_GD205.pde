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

void mousePressed(){
  chargeTime = millis(); // shows how long the mouse button is pressed for each bullet type
}

void mouseReleased(){
  chargeTime = millis() - chargeTime;
  println("chargeTime", chargeTime);
  int slowCharge = 1000; // need to hold m1 for 1 second for big charge
  int mediCharge = 500; // need to hold m1 for 0.5 seconds for medium charge
  
  if(chargeTime > slowCharge){
    b = new Bullet(mouseX, mouseY, "main");
  } else if(chargeTime > mediCharge){
    b = new Bullet(mouseX, mouseY, "alt");
  }
}
