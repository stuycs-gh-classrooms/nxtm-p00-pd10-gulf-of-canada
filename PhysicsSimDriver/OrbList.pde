class OrbList {

  OrbNode front;

  OrbList() {
    front = null;
  }// constructor

  void assignDemo5Force() {
    for (OrbNode i = front; i != null; i = i.next) {  //Linked List For Loop implementation with inspiration from Mr. DW and Lucas Zheng
      if (random(1) < 0.5) {
        i.demo5Gravity = true; // In demo 5, Only Gravity gets applied to Orb
      } else {
        i.demo5Gravity = false; // In demo 5, Only Centripetal gets applied to Orb
      }
    }
  } //randomly assigns orbs either Centripetal or Gravity in Demo 5

  void populate(int n) {
    front = null; //clear list, all the nexts and previouses are only accessible given front's next or previous is meaningful
    front = new OrbNode(); //since first element is null
    for (int i = 0; i < n-1; i ++) {
      addFront(new OrbNode());
    }
    assignDemo5Force();
  }//populate
  void applyGravity(Orb other, float gConstant) {
    for (OrbNode i = front; i != null; i = i.next) {
      PVector appG = i.getGravity(other, gConstant);
      i.applyForce(appG);
    }
  }//applySprings

  void applySprings(int springLength, float springK) {
    for (OrbNode i = front; i != null; i = i.next) {
      i.applySprings(springLength, springK);
    }
  }//applySprings

  void applyDrag(float dCoef) {
    for (OrbNode i = front; i != null; i = i.next) {
      if (i.center.y > 200) {
        PVector appD = i.getDragForce(dCoef);
        i.applyForce(appD.mult(5));
        if (i.center.y > 400) {
          i.applyForce(appD.mult(10));
        }
      }
    }
  }//applyDrag

  void applyCentripetal(Orb other, boolean fixedStringLength, int stringLength) {
    for (OrbNode i = front; i != null; i = i.next) {
      PVector appC = i.getCentripetal(other, fixedStringLength, stringLength);
      i.applyForce(appC);
    }
  } //applyCentripetal

  void applyTangent() {
    for (OrbNode i = front; i != null; i = i.next) {
      PVector appT = i.makeTangent(i.getGravity(o, G_CONSTANT));
      i.applyForce(appT);
    } //returns vector tangent to gravity
  } //applyTangent
  
  void applyCombo(Orb other, boolean fixedStringLength, int stringLength,  float gConstant) {
    for (OrbNode i = front; i != null; i = i.next){
      if (i.demo5Gravity){
        PVector appG = i.getGravity(other, gConstant);
        i.applyForce(appG);
      }
      else{
        PVector appC = i.getCentripetal(other, fixedStringLength, stringLength);
        i.applyForce(appC);
      }
    }
  }//applyCombo

  void addFront(OrbNode o) {
    front.previous = o;
    o.next = front;
    front = front.previous;
  }//addFront

  void removeFront() {
    front = front.next; //change forward pointer
    front.previous = null; //deleting
  }//removeFront

  OrbNode getSelected(float x, float y) {
    for (OrbNode i = front; i != null; i = i.next) {
      if (i.isSelected(x, y)) {
        return i;
      }
    }
    return null;
  }//getSelected

  void removeNode(OrbNode o) {
    if (o.previous != null) {
      o.previous.next = o.next;
    }
    if (o.next != null) {
      o.next.previous = o.previous;
    }
  }//remove node

  void display() {
    for (OrbNode i = front; i != null; i = i.next) {
      if (toggles[CENTRIPETAL]) {
        i.display(o);
      } //display springs for demo 4
      else if (toggles[COMBINED]){
        if (i.demo5Gravity){
          i.display();
        }
        else{
          i.display(o);
        }
      } //display springs for demo 5
      else {
        i.display();
      } //display orb
    }
  }//display

  void run(boolean bounce) {
    for (OrbNode i = front; i != null; i = i.next) {
      i.move();
    }
  }//applySprings
}//OrbList
