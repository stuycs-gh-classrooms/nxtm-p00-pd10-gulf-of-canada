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
int COMBINED = 6;
boolean[] toggles = new boolean[7];
String[] modes = {"Moving", "Bounce", "Gravity", "Spring", "Drag", "Centripetal", "Combined"};

FixedOrb earth, o;
OrbNode front;
OrbList LL;


void setup() {
  size(600, 600);

  earth = new FixedOrb(width/2, height /2, 3 * MAX_SIZE, 3 * MAX_MASS);
  front = null;
  LL = new OrbList();
  LL.populate(NUM_ORBS);

  o = new FixedOrb(width/2, height/2, random(MIN_SIZE, MAX_SIZE), random(MIN_MASS, MAX_MASS));
}//setup

void draw() {
  background(255);
  displayMode();
  if (toggles[MOVING]) {

    if (toggles[GRAVITY]) {
      earth.display();
      //toggles[BOUNCE] = true;
      LL.applyGravity(earth, G_CONSTANT);
    } //gravity

    if (toggles[SPRING]) {
      LL.applySprings(SPRING_LENGTH, SPRING_K);
    } //spring

    if (toggles[DRAGF]) {
      fill(225, 0, 0);
      rect(0, 200, width, 200);
      fill(36, 205, 236);
      rect(0, 400, width, 200);

      LL.applyGravity(earth, G_CONSTANT);
      LL.applyDrag(D_COEF);
    } //dragf

    if (toggles[CENTRIPETAL]) {
      LL.applyCentripetal(o, true, SPRING_LENGTH);
      o.display();
    } //centripetal
    if (toggles[COMBINED]) {
      LL.applyCombo(o, false, SPRING_LENGTH, G_CONSTANT);
      o.display();
    } //combined
    
    LL.display();
    LL.run(toggles[BOUNCE]);
    if (toggles[CENTRIPETAL]) {
    fill(0);
    textSize(16);
    text("(Click to activate)", 370, 30); 
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
    toggles[SPRING] = false;
    toggles[DRAGF] = false;
    toggles[CENTRIPETAL] = false;
    toggles[COMBINED] = false;
    reset(); 
  } //activate gravity
  if (key == '2') {
    toggles[SPRING] = !toggles[SPRING];
    toggles[GRAVITY] = false;
    toggles[DRAGF] = false;
    toggles[CENTRIPETAL] = false;
    toggles[COMBINED] = false;
    reset();
  } //activate spring
  if (key == '3') {
    toggles[DRAGF] = !toggles[DRAGF];
    toggles[GRAVITY] = false;
    toggles[SPRING] = false;
    toggles[CENTRIPETAL] = false;
    toggles[COMBINED] = false;
    reset();
  } //activate dragf
  if (key == '4') {
    toggles[CENTRIPETAL] = !toggles[CENTRIPETAL];
    toggles[GRAVITY] = false;
    toggles[SPRING] = false;
    toggles[DRAGF] = false;
    toggles[COMBINED] = false;
    reset();
  } //activate centripetal
  if (key == '5') {
    toggles[COMBINED] = !toggles[COMBINED];
    toggles[GRAVITY] = false;
    toggles[SPRING] = false;
    toggles[DRAGF] = false;
    toggles[CENTRIPETAL] = false;
    reset();
  } //activate combined
  if (key == '+' || key == '=') {
    LL.addFront(new OrbNode());
  } //add
  if (key == '-') {
    LL.removeFront();
  } //remove
  if (key == 'r') {
    reset();
  } //reset
}//keyPressed

void mousePressed() {
  if (toggles[CENTRIPETAL] || toggles[COMBINED]) {
    LL.applyTangent();
  } //apply Tangent
  
  OrbNode selected = LL.getSelected(mouseX, mouseY);
  
  if (selected != null) {
    LL.removeNode(selected);
  } //remove selected Node
}//mousePressed
void reset() {
  front = null;
  LL = new OrbList();
  LL.populate(NUM_ORBS);
}

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
    if (m == 1) {
     x+= w+20; 
    }
    x+= w+5;
  }
}//display
