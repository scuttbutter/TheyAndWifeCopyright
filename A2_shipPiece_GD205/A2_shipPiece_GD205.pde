//fyi i just finished persona 3 gameplay and im like actually in fucking tears while editing this!
//IT WAS SO UCKED UP WHY DID THEY MAKE ME WATCH THAT! I HATE PERSONA ,,,, they dont prepare you enough for this 
//its gonna take me 3 weeks to recover from what i saw on my screen,
//Hi siul! i hope it works now bbg


float shapeX, shapeY; // Position of the movable shape
float shapeSize = 50;  // Size of the shape
ArrayList<Bullet> bullets; // Array to store the bullets

void setup(){
  size(666, 666);
  shapeX = width / 2 - shapeSize / 2; // Start in the center of the screen
  shapeY = height - 100; // Position the shape a little above the bottom
  bullets = new ArrayList<Bullet>(); // Initialize the bullets array
}

void draw(){
  background(0);
  
  // Display the shape at the updated position
  fill(255, 0, 0); // Red color for the movable shape
  noStroke();
  rect(shapeX, shapeY, shapeSize, shapeSize); // Draw the shape (a rectangle in this case)

  // Display and update each bullet
  for (int i = bullets.size() - 1; i >= 0; i--) {
    Bullet b = bullets.get(i);
    b.display();
    b.update();
    
    // Remove bullets that are off the screen
    if (b.posB.y < 0) {
      bullets.remove(i);
    }
  }
}

void keyPressed(){
  // Move the shape with the arrow keys
  if (keyCode == LEFT) {
    shapeX -= 5; // Move left by 5 units
  } else if (keyCode == RIGHT) {
    shapeX += 5; // Move right by 5 units
  } 

  // Shoot bullets when space is pressed
  if (key == ' ') {
    bullets.add(new Bullet(shapeX + shapeSize / 2, shapeY, "main"));
  }
  
  // Create new bullets on 'q' key (for alternative bullets)
  if (key == 'q') {
    bullets.add(new Bullet(shapeX + shapeSize / 2, shapeY, "alt"));
  }
}
