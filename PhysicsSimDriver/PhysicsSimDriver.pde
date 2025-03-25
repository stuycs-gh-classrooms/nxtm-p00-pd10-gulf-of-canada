int NUM_ORBS = 10;
int MIN_SIZE = 10;
int MAX_SIZE = 60;
float MIN_MASS = 10;
float MAX_MASS = 100;
float G_CONSTANT = 1;
float D_COEF = 0.1;

int SPRING_LENGTH = 50;
float  SPRING_K = 0.005;

int MOVING = 0;
int BOUNCE = 1;
int GRAVITY = 2;
int SPRING = 3;
int DRAGF = 4;
int CENTRIPETAL = 5;
int MOMENTUM = 6;
int COMBINED = 7;
boolean[] toggles = new boolean[8];
String[] modes = {"Moving", "Bounce", "Gravity", "Spring" ,"Drag", "Centripetal", "Momentum", "Combined"}; //should probably only choose one of the two forces

FixedOrb earth;


void setup() {
  size(600, 600);

  earth = new FixedOrb(width/2, height * 200, 1, 20000);

}//setup

void draw() {
  background(255);
  displayMode();


  if (toggles[MOVING]) {

    

    if (toggles[GRAVITY]) {
      
    }
    
    if (toggles[SPRING]){
    
    }
    
  }//moving
}//draw


void keyPressed() {
  if (key == ' ') {
    toggles[MOVING] = !toggles[MOVING];
  }
  if (key == 'b') {
    toggles[BOUNCE] = !toggles[BOUNCE];
  }
  if (key == '1') {
   toggles[GRAVITY] = !toggles[GRAVITY]; 
  }
  if (key == '2'){
    toggles[SPRING] = !toggles[SPRING];
  }
  if (key == '3'){
    toggles[DRAGF] = !toggles[DRAGF];
  }
  if (key == '4') {
   toggles[CENTRIPETAL] = !toggles[CENTRIPETAL];
  }
  if (key == '5') {
   toggles[MOMENTUM] = !toggles[MOMENTUM];
  }
  if (key == '6') {
   toggles[COMBINED] = !toggles[COMBINED];
  }
}//keyPressed


void displayMode() {
  textAlign(LEFT, TOP);
  textSize(20);
  noStroke();
  int spacing = 85;
  int x = 0;

  for (int m=0; m<toggles.length; m++) {
    //set box color
    if (toggles[m]) {
      fill(0, 255, 0);
    } else {
      fill(255, 0, 0);
    }

    float w = textWidth(modes[m]);
    rect(x, 0, w+5, 20);
    fill(0);
    text(modes[m], x+2, 2);
    x+= w+5;
  }
}//display
