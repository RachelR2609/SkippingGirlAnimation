//This is a 2.5D parallax scrolling Processing sketch of a girl walking and skipping sprite animation with 4 different backgrounds 
//The backgrounds will each be moving at a different speed 
//There are 8 poses of the girl
//ID:18007594

PImage[] girlFrames = new PImage[8];  //This is the 8 poses of the Girl walking 
PImage[] bg = new PImage[4];          //The 4 background images ( Background sky, Farground,Middleground and Foreground)
int[] xpos = new int[4];         // This represents the coordinates of the background images    
int[] ypos = new int[4];         
int[] rate = new int[4];         // Horizontal scrolling rate of backgrounds
int counter = 0;                 // Animation counter for girl sprite

void setup() {
  size(800, 600);                        // This will be the size of the graphics window
  frameRate(15);                         // Number of frames per second 
  bg[0] = loadImage("Background.png");   //This is the loading of the 4 background images 
  bg[1] = loadImage("Farground.png");
  bg[2] = loadImage("Middleground.png");
  bg[3] = loadImage("Foreground.png");

  ypos[0] = 0; 
  rate[0] = 0;             // Setting the y positions and scrolling rates for background images 
  ypos[1] = -60; 
  rate[1] = 1;
  ypos[2] = -30; 
  rate[2] = 2;
  ypos[3] = 50; 
  rate[3] = 5;
  PImage girl = loadImage("Chibi Witch Final.png");  // Load the girl sprite sheet
  for (int i = 0; i < 8; i++) {
    girlFrames[i] = girl.get(i*girl.width/8, 0, girl.width/8, girl.height);   // sets (x,y,w,h)
  }
}

void draw() {
  for (int i = 0; i < 4; i++) {
    image(bg[i], -xpos[i], ypos[i]);              // Draw the four background images
    image(bg[i], bg[i].width-xpos[i], ypos[i]);   // with wrap-around.
    xpos[i] = (xpos[i] + rate[i]) % bg[i].width;
  }
  image(girlFrames[counter], 0, 0);               // Draw character and loop through all 8 poses 
  counter = (counter + 1) % 8;
}
