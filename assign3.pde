final int GAME_START = 0, GAME_RUN = 1, GAME_OVER = 2;
int gameState = 0;

final int GRASS_HEIGHT = 15;
final int START_BUTTON_W = 144;
final int START_BUTTON_H = 60;
final int START_BUTTON_X = 248;
final int START_BUTTON_Y = 360;

PImage title, gameover, startNormal, startHovered, restartNormal, restartHovered;
PImage bg, soil8x24, soil0, soil1,soil2,soil3,soil4,soil5;
PImage stone1, stone2,life;

// For debug function; DO NOT edit or remove this!
int playerHealth = 0;
float cameraOffsetY = 0;
boolean debugMode = false;

void setup() {
	size(640, 480, P2D);
	// Enter your setup code here (please put loadImage() here or your game will lag like crazy)
	bg = loadImage("img/bg.jpg");
	title = loadImage("img/title.jpg");
	gameover = loadImage("img/gameover.jpg");
	startNormal = loadImage("img/startNormal.png");
	startHovered = loadImage("img/startHovered.png");
	restartNormal = loadImage("img/restartNormal.png");
	restartHovered = loadImage("img/restartHovered.png");
	soil8x24 = loadImage("img/soil8x24.png");

  soil0 = loadImage("img/soil0.png");
  soil1 = loadImage("img/soil1.png");
  soil2 = loadImage("img/soil2.png");
  soil3 = loadImage("img/soil3.png");
  soil4 = loadImage("img/soil4.png");
  soil5 = loadImage("img/soil5.png");
  
  stone1 = loadImage("img/stone1.png");
  stone2 = loadImage("img/stone2.png");
  
  life = loadImage("img/life.png");
}

void draw() {
    /* ------ Debug Function ------ 

      Please DO NOT edit the code here.
      It's for reviewing other requirements when you fail to complete the camera moving requirement.

    */
    if (debugMode) {
      pushMatrix();
      translate(0, cameraOffsetY);
    }
    /* ------ End of Debug Function ------ */

    
	switch (gameState) {

		case GAME_START: // Start Screen
		image(title, 0, 0);

		if(START_BUTTON_X + START_BUTTON_W > mouseX
	    && START_BUTTON_X < mouseX
	    && START_BUTTON_Y + START_BUTTON_H > mouseY
	    && START_BUTTON_Y < mouseY) {

			image(startHovered, START_BUTTON_X, START_BUTTON_Y);
			if(mousePressed){
				gameState = GAME_RUN;
				mousePressed = false;
			}

		}else{

			image(startNormal, START_BUTTON_X, START_BUTTON_Y);

		}
		break;

		case GAME_RUN: // In-Game

		// Background
		image(bg, 0, 0);

		// Sun
	    stroke(255,255,0);
	    strokeWeight(5);
	    fill(253,184,19);
	    ellipse(590,50,120,120);

		// Grass
		fill(124, 204, 25);
		noStroke();
		rect(0, 160 - GRASS_HEIGHT, width, GRASS_HEIGHT);

		// Soil - REPLACE THIS PART WITH YOUR LOOP CODE!
		/*for(int i=0 ; i<width; i+=80){
    int soilX=i; int soilY=160;
    image(soil0, soilX, soilY);
    }*/
    
    for(int i=0 ; i<width; i+=80){
      for(int j=160 ; j<320+160; j+=80){
    int soilX=i; int soilY=j;
    image(soil0, soilX, soilY);
    }}
    
    for(int i=0 ; i<width; i+=80){
      for(int j=480 ; j<640+160; j+=80){
    int soilX=i; int soilY=j;
    image(soil1, soilX, soilY);
    }}
    
    for(int i=0 ; i<width; i+=80){
      for(int j=800 ; j<960+160; j+=80){
    int soilX=i; int soilY=j;
    image(soil2, soilX, soilY);
    }}
    
    for(int i=0 ; i<width; i+=80){
      for(int j=1120 ; j<1280+160; j+=80){
    int soilX=i; int soilY=j;
    image(soil3, soilX, soilY);
    }}
    
    for(int i=0 ; i<width; i+=80){
      for(int j=1440 ; j<1600+160; j+=80){
    int soilX=i; int soilY=j;
    image(soil4, soilX, soilY);
    }}
    
    for(int i=0 ; i<width; i+=80){
      for(int j=1760 ; j<1920+160; j+=80){
    int soilX=i; int soilY=j;
    image(soil5, soilX, soilY);
    }}
    
    //1star stone
    for(int i=0; i<width; i+=80){
    int stone1X= i ; int stone1Y = i+160;
    image(stone1,stone1X,stone1Y);
}

    //life
    for(int i = 10; i<71*5+10; i+=71){
    int lifeX=i; int lifeY=10;
    image(life, lifeX, lifeY);
    }

		// Player

		// Health UI

		break;

		case GAME_OVER: // Gameover Screen
		image(gameover, 0, 0);
		
		if(START_BUTTON_X + START_BUTTON_W > mouseX
	    && START_BUTTON_X < mouseX
	    && START_BUTTON_Y + START_BUTTON_H > mouseY
	    && START_BUTTON_Y < mouseY) {

			image(restartHovered, START_BUTTON_X, START_BUTTON_Y);
			if(mousePressed){
				gameState = GAME_RUN;
				mousePressed = false;
				// Remember to initialize the game here!
			}
		}else{

			image(restartNormal, START_BUTTON_X, START_BUTTON_Y);

		}
		break;
		
	}

    // DO NOT REMOVE OR EDIT THE FOLLOWING 3 LINES
    if (debugMode) {
        popMatrix();
    }
}

void keyPressed(){
	// Add your moving input code here

	// DO NOT REMOVE OR EDIT THE FOLLOWING SWITCH/CASES
    switch(key){
      case 'w':
      debugMode = true;
      cameraOffsetY += 25;
      break;

      case 's':
      debugMode = true;
      cameraOffsetY -= 25;
      break;

      case 'a':
      if(playerHealth > 0) playerHealth --;
      break;

      case 'd':
      if(playerHealth < 5) playerHealth ++;
      break;
    }
}

void keyReleased(){
}
