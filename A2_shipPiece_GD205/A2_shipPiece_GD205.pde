//fyi i just finished persona 3 gameplay and im like actually in fucking tears while editing this!
//IT WAS SO UCKED UP WHY DID THEY MAKE ME WATCH THAT! I HATE PERSONA ,,,, they dont prepare you enough for this
//its gonna take me 3 weeks to recover from what i saw on my screen,
//Hi siul! i hope it works now bbg
//Hi scott I did work :3 thank you bbt
// Controls for main bullet is space, Alt bullet is Q and movement is A for left D for right
float shapeX, shapeY; // Position of the movable shape
float shapeSize = 50;  // Size of the shape
ArrayList<Bullet> bullets; // Array to store the bullets
ArrayList <Enemy> en; // Array to store the enemies
float [] spawnPoints = { 50, 150, 250, 350, 450, 550 }; // spawn points for all the enemies

float lastMainShotTime = 0; // Time of the last "main" bullet shot
float lastAltShotTime = 0;  // Time of the last "alt" bullet shot
float mainCooldown = 0.25;   // Main fire cooldown in seconds (1.5 seconds)
float altCooldown = 1.0;    // Alt fire cooldown in seconds (3 seconds)


void setup() {
  size(666, 666);
  shapeX = width / 2 - shapeSize / 2; // Start in the center of the screen
  shapeY = height - 100; // Position the shape a little above the bottom
  bullets = new ArrayList<Bullet>(); // Initialize the bullets array
  en = new ArrayList<Enemy>(); // Initialize the enemies array
  // creates a loop to spawn all the enemies and adds to the arraylist
  for(int i = 0; i <spawnPoints.length; i++){
    Enemy e = new Enemy(spawnPoints[i], 100, 30, 80);
    en.add(e);
  }
  
}

void draw() {
  background(2,33,30);

  // Display the shape at the updated position
  fill(#AD50D8); // PURPLE NOW !
  noStroke();
  rect(shapeX, shapeY, shapeSize, shapeSize); // Draw the shape (a rectangle in this case)
  
  // cycle through the arraylist and spawns all the enemies
  for(Enemy en : en){
    en.display(); // spawns the enemies
    en.update(); // makes them move every 2 seconds     
  }
  
  // removes each enemy when the bullet hits the enemy
  for(int i = en.size() - 1; i >= 0; i--){
    Enemy e = en.get(i);
    if(e.pleaseDie == true){
      en.remove(e);
    }
    if(i == 0){
      e.allDead = true;
    }
  }
  
  // Display and update each bullet
  for (int i = bullets.size() - 1; i >= 0; i--) {
    Bullet b = bullets.get(i);
    b.display();
    b.update();
    
    for(Enemy en : en){
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
    shapeX -= 5;
  } else if (keyCode == 'D') {
    shapeX += 5; 
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

void keyReleased(){
  
}
