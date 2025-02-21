float shapeX, shapeY; // Position of the movable shape
float shapeSize = 50;  // Size of the shape
<<<<<<< Updated upstream

//fyi i just finished persona 3 gameplay and im like actually in fucking tears while editing this!-scott
//IT WAS SO UCKED UP WHY DID THEY MAKE ME WATCH THAT! I HATE PERSONA ,,,, they dont prepare you enough for this -scott



ArrayList <Enemy> en;
Bullet b;
Enemy e;
=======
ArrayList<Bullet> bullets; // Array to store the bullets
>>>>>>> Stashed changes

void setup(){
  size(666, 666);
  shapeX = width / 2 - shapeSize / 2; // Start in the center of the screen
  shapeY = height - 100; // Position the shape a little above the bottom
<<<<<<< Updated upstream
  e = new Enemy(111, 111, 30, 60);
  en = new ArrayList <Enemy> ();
  en.add(e);
  // Initialize a bullet (it won't move with the shape, just exists on screen)
  b = new Bullet(333, 333, "type");
=======
  bullets = new ArrayList<Bullet>(); // Initialize the bullets array
>>>>>>> Stashed changes
}

void draw(){
  background(0);
  
  // Display the shape at the updated position
  fill(255, 0, 0); // Red color for the movable shape
  noStroke();
  rect(shapeX, shapeY, shapeSize, shapeSize); // Draw the shape (a rectangle in this case)

<<<<<<< Updated upstream
  // Display and update the bullet
  b.display();
  b.update();
  
  for(Enemy en : en){
    en.display();
    
    if(frameCount % 120 == 0){
      en.update();
=======
  // Display and update each bullet
  for (int i = bullets.size() - 1; i >= 0; i--) {
    Bullet b = bullets.get(i);
    b.display();
    b.update();
    
    // Remove bullets that are off the screen
    if (b.posB.y < 0) {
      bullets.remove(i);
>>>>>>> Stashed changes
    }
  }
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

  // Shoot bullets when space is pressed
  if (key == ' ') {
    bullets.add(new Bullet(shapeX + shapeSize / 2, shapeY, "main"));
  }
  
  // Create new bullets on 'q' key (for alternative bullets)
  if (key == 'q') {
    bullets.add(new Bullet(shapeX + shapeSize / 2, shapeY, "alt"));
  }
}
