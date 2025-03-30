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
Orb o0, o1;
OrbNode front;


void setup() {
  size(600, 600);

  earth = new FixedOrb(width/2, height * 200, 1, 20000);

  o0 = new Orb();
  o1 = new Orb();
  o = new FixedOrb();
  
}//setup

void draw() {
  background(255);
  displayMode();



  if (toggles[MOVING]) {
    if (toggles[GRAVITY]) {
      o0.applyForce(o0.getGravity(o1, G_CONSTANT));
      o1.applyForce(o1.getGravity(o0, G_CONSTANT));
    }

    if (toggles[DRAGF]) { //manually turn on gravity?
      //println("tsugoshi");
      fill(255, 0, 0);
      rect(0, 200, width, 200);
      fill(136, 205, 236);
      rect(0, 400, width, 200);

      if (o0.center.y + o0.bsize/2 > 200) {
        o0.applyForce(o0.getDragForce(10*D_COEF));
        if (o0.center.y + o0.bsize/2 > 400) {
          o0.applyForce(o0.getDragForce(100*D_COEF));
        }
      }

      if (o1.center.y + o1.bsize/2 > 200) {
        o1.applyForce(o1.getDragForce(10*D_COEF));
        if (o1.center.y + o1.bsize/2 > 400) {
          o1.applyForce(o1.getDragForce(100*D_COEF));
        }
      }
    }



    if (toggles[SPRING]) {
      stroke(0);
      line(o0.center.x, o0.center.y, o1.center.x, o1.center.y);


      o0.applyForce(o0.getSpring(o1, SPRING_LENGTH, SPRING_K));
      o1.applyForce(o1.getSpring(o0, SPRING_LENGTH, SPRING_K));
    }



    if (toggles[CENTRIPETAL]) {
      o1.applyForce(o1.getCentripetal(o, true, SPRING_LENGTH));    
      
      
      o.display();
      
      stroke(0);
      line(o.center.x, o.center.y, o1.center.x, o1.center.y);
    }

    if (toggles[COMBINED]) {
      o.center = new PVector(width/2, height/2);
     
      o.display();
      
      o0.applyForce(o0.getGravity(o, G_CONSTANT));
      o1.applyForce(o1.getCentripetal(o, true, SPRING_LENGTH));
      stroke(0);
      line(o.center.x, o.center.y, o1.center.x, o1.center.y);
    }
    
  o0.move(false);
  o1.move(false);
  }//moving

  o0.display();
  o1.display();
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
  if (key == '2') {
    toggles[SPRING] = !toggles[SPRING];
  }
  if (key == '3') {
    toggles[DRAGF] = !toggles[DRAGF];
  }
  if (key == '4') {
    toggles[CENTRIPETAL] = !toggles[CENTRIPETAL];
  }
  if (key == '5') {
    toggles[COMBINED] = !toggles[COMBINED];
  }
  if (key == 'r') {
    o0 = new Orb();
    o1 = new Orb();
    o = new FixedOrb();
  }
}//keyPressed
PVector makeTangent(PVector r){
   return new PVector(-r.y, r.x); //tangent vector

}

void mousePressed(){
  if (toggles[CENTRIPETAL] || toggles[COMBINED]){
    //o1.acceleration.add(10*(PVector.sub(o1.center, o.center).normalize().y), -10*(PVector.sub(o1.center, o.center).normalize().x));
    o1.velocity.add(new PVector(1, 0));
    //float invx = o1.getCentripetal(o, true, SPRING_LENGTH).x * -1;
    //float y = o1.getCentripetal(o, true, SPRING_LENGTH).x;
    
    PVector velocity = makeTangent(o1.getCentripetal(o, true, SPRING_LENGTH));
    o1.applyForce(velocity);
  }
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
    x+= w+5;
  }
}//display
