//fyi i just finished persona 3 gameplay and im like actually in fucking tears while editing this!
//IT WAS SO UCKED UP WHY DID THEY MAKE ME WATCH THAT! I HATE PERSONA ,,,, they dont prepare you enough for this
//its gonna take me 3 weeks to recover from what i saw on my screen,
//Hi siul! i hope it works now bbg
//Hi scott I did work :3 thank you bbt
// Controls space for main fire q for alt fire a and d for left and right movement

float shapeX, shapeY; // Position of the movable shape
float shapeSize = 50;  // Size of the shape

ArrayList<Bullet> bullets; // Array to store the bullets
ArrayList <Enemy> en; // Array to store the enemies
float [] spawnPoints = { 50, 150, 250, 350, 450, 550 }; // spawn points for all the enemies

float lastMainShotTime = 0; // Time of the last "main" bullet shot
float lastAltShotTime = 0;  // Time of the last "alt" bullet shot
float mainCooldown = 0.25;   // Main fire cooldown in seconds (1.5 seconds)
float altCooldown = 1.0;    // Alt fire cooldown in seconds (3 seconds)

boolean isMovingRight; // checks to see if player is moving right
boolean isMovingLeft; // checks to see if player is moving left

void setup() {
  size(666, 666);
  shapeX = width / 2 - shapeSize / 2; // Start in the center of the screen
  shapeY = height - 100; // Position the shape a little above the bottom

  bullets = new ArrayList<Bullet>(); // Initialize the bullets array
  en = new ArrayList<Enemy>(); // Initialize the enemies array
  // creates a loop to spawn all the enemies and adds to the arraylist
  for (int i = 0; i <spawnPoints.length; i++) {
    Enemy e = new Enemy(spawnPoints[i], 100, 30, 80);
    en.add(e);
  }

  isMovingRight = false;
  isMovingLeft = false;
}

void draw() {
  background(2, 33, 30);

  // Conditional statement to make player move :3
  if (isMovingRight == true) {
    shapeX += 5;
  }
  if (isMovingLeft == true) {
    shapeX -= 5;
  }

  // Display the shape at the updated position
  fill(#AD50D8); // PURPLE NOW !
  noStroke();
  rect(shapeX, shapeY, shapeSize, shapeSize); // Draw the shape (a rectangle in this case)

  // cycle through the arraylist and spawns all the enemies
  for (Enemy en : en) {
    en.display(); // spawns the enemies
    en.update(); // makes them move every 2 seconds
    
    for(int i = 0; en.pleaseDie == true; i++){
      if(i % 6 ==0){
        en.display();
        en.update();
      }
    }
  }

  // removes each enemy when the bullet hits the enemy
  for (int i = en.size() - 1; i >= 0; i--) {
    Enemy e = en.get(i);
    if (e.pleaseDie == true) {
      en.remove(e);
    }
    if (i == 0) {
      e.allDead = true;
    }
  }

  // Display and update each bullet
  for (int i = bullets.size() - 1; i >= 0; i--) {
    Bullet b = bullets.get(i);
    b.display();
    b.update();

    for (Enemy en : en) {
      b.hitEnemy(en);
    }

    // Remove bullets that are off the screen
    if (b.posB.y < 0) {
      bullets.remove(i);
    }
  }
}

void keyPressed() {
  if (keyCode == 'A') {
    isMovingLeft = true;
  } else if (keyCode == 'D') {
    isMovingRight = true;
  }

  // Shoot "main" bullet if enough time has passed
  if (key == ' ' && (millis() - lastMainShotTime) / 1000.0 > mainCooldown) {
    bullets.add(new Bullet(shapeX + shapeSize / 2, shapeY, "main"));
    lastMainShotTime = millis(); // Record the time of this shot
  }

  // Shoot "alt" bullet if enough time has passed
  if (keyCode == 'Q' && (millis() - lastAltShotTime) / 1000.0 > altCooldown) {
    bullets.add(new Bullet(shapeX + shapeSize / 2, shapeY, "alt"));
    lastAltShotTime = millis(); // Record the time of this shot
  }
}

// checks to see if player is no longer holding a or d
void keyReleased() {
  if (keyCode == 'A') {
    isMovingLeft = false;
  } else if (keyCode == 'D') {
    isMovingRight = false;
  }
}
