class Orb {

  //instance variables
  PVector center;
  PVector velocity;
  PVector acceleration;
  float bsize;
  float mass;
  color c;
  float maxSpeed;
  boolean demo5Gravity;


  Orb() {
    bsize = random(10, MAX_SIZE);
    float x = random(bsize/2, width-bsize/2);
    float y = random(bsize/2, height-bsize/2);
    center = new PVector(x, y);
    mass = random(10, 100);
    velocity = new PVector();
    acceleration = new PVector();
    setColor();
    maxSpeed = 400;
  } //constructor

  Orb(float x, float y, float s, float m) {
    bsize = s;
    mass = m;
    center = new PVector(x, y);
    velocity = new PVector();
    acceleration = new PVector();
    setColor();
    maxSpeed = 400;
  } //overloaded constructor

  //movement behavior
  void move() {
    if (toggles[BOUNCE]) {
      xBounce();
      yBounce();
    }

    velocity.add(acceleration);

    center.add(velocity);
    acceleration.mult(0);
  }//move

  void applyForce(PVector force) {
    PVector scaleForce = force.copy();
    scaleForce.div(mass);
    acceleration.add(scaleForce);
  }//applyForce

  PVector getDragForce(float cd) {
    float dragMag = velocity.mag();
    dragMag = -0.5 * dragMag * dragMag * cd;
    PVector dragForce = velocity.copy();
    dragForce.normalize();
    dragForce.mult(dragMag);
    return dragForce;
  }//getDrag

  PVector getGravity(Orb other, float G) {
    float strength = G * mass*other.mass;
    float r = max(center.dist(other.center), MIN_SIZE); //dont want to divide by 0!
    strength = strength/ pow(r, 2);
    PVector force = other.center.copy();
    force.sub(center);
    force.mult(strength);
    return force;
  }//getGravity

  //spring force between calling orb and other
  PVector getSpring(Orb other, int springLength, float springK) {
    PVector direction = PVector.sub(other.center, this.center);
    direction.normalize();

    float displacement = this.center.dist(other.center) - springLength;
    float mag = springK * displacement;
    direction.mult(mag);

    return direction;
  }//getSpring
  PVector getCentripetal(Orb other, boolean fixedStringLength, int stringLength) {
    float radius = max(max(this.bsize, other.bsize), PVector.dist(other.center, this.center)); //the bigger of the two orbs otherwise will teleport from center to fixed distance away
    float centripetalForce = this.mass * this.velocity.magSq() / radius;

    if (fixedStringLength) {
      radius = stringLength;
    }

    PVector direction = PVector.sub(other.center, this.center).normalize();
    direction.mult(centripetalForce);

    return direction;
  }//getCentripetal
  PVector makeTangent(PVector r) {
    return new PVector(-r.y, r.x); 
  }//makeTangent

  boolean yBounce() {
    if (center.y > height - bsize/2) {
      velocity.y *= -1;
      center.y = height - bsize/2;

      return true;
    }//bottom bounce
    else if (center.y < bsize/2) {
      velocity.y*= -1;
      center.y = bsize/2;
      return true;
    }
    return false;
  }//yBounce
  boolean xBounce() {
    if (center.x > width - bsize/2) {
      center.x = width - bsize/2;
      velocity.x *= -1;
      return true;
    } else if (center.x < bsize/2) {
      center.x = bsize/2;
      velocity.x *= -1;
      return true;
    }
    return false;
  }//xbounce

  boolean collisionCheck(Orb other) {
    return ( this.center.dist(other.center)
      <= (this.bsize/2 + other.bsize/2) );
  }//collisionCheck

  boolean isSelected(float x, float y) {
    float d = dist(x, y, center.x, center.y);
    return d < bsize/2;
  }//isSelected

  void setColor() {
    color c0 = color(0, 255, 255);
    color c1 = color(0);
    c = lerpColor(c0, c1, (mass-MIN_SIZE)/(MAX_MASS-MIN_SIZE));
  }//setColor

  void display() {
    noStroke();
    fill(c);
    circle(center.x, center.y, bsize);
    fill(0);
  }//display
}//Orb
