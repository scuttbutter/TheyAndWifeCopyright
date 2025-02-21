float shapeX, shapeY; // Position of the movable shape
float shapeSize = 50;  // Size of the shape

Bullet b;

void setup(){
  size(666, 666);
  shapeX = width / 2; // Start in the center of the screen
  shapeY = height - 100; // Position the shape a little above the bottom
  
  // Initialize a bullet (it won't move with the shape, just exists on screen)
  b = new Bullet(333, 333, "type");
}

void draw(){
  background(0);
  
  // Display the shape at the updated position
  fill(255, 0, 0); // Red color for the movable shape
  noStroke();
  rect(shapeX, shapeY, shapeSize, shapeSize); // Draw the shape (a rectangle in this case)

  // Display and update the bullet
  b.display();
  b.update();
}

void keyPressed(){
  // Move the shape with the arrow keys
  if (keyCode == LEFT) {
    shapeX -= 5; // Move left by 5 units
  } else if (keyCode == RIGHT) {
    shapeX += 5; // Move right by 5 units
  } else if (keyCode == UP) {
    shapeY -= 5; // Move up by 5 units
  } else if (keyCode == DOWN) {
    shapeY += 5; // Move down by 5 units
  }

  // Create new bullets on space bar or 'q' key
  if(key == ' '){
    b = new Bullet(333, 333, "main");
  }
  
  if(key == 'q'){
    b = new Bullet(333, 333, "alt");
  }
}
