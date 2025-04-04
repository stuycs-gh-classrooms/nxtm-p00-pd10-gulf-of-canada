class OrbList {

  OrbNode front;

  OrbList() {
    front = null;
  }//constructor

  void populate(int n, boolean ordered) {
    front = null; //clear list, all the nexts and previouses are only accessible given front's next or previous is meaningful

    if (!ordered) {
      front = new OrbNode(); //since first element is null
      for (int i = 0; i < n-1; i ++) {
        addFront(new OrbNode());
      }
    } //add random non-ordered orb
    else {
      front = new OrbNode(width-100, height/2, random(MIN_SIZE, MAX_SIZE), random(MIN_MASS, MAX_MASS)); //since first element is null
      float x = width-100-SPRING_LENGTH; //to make the first node appear on left side of screen
      for (int i = 0; i < n-1; i++) {
        addFront(new OrbNode(x, height/2, random(MIN_SIZE, MAX_SIZE), random(MIN_MASS, MAX_MASS)));
        x -= SPRING_LENGTH;
      } //add spring_length each time
    }
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
  
  void applyDrag(float dCoef){
    for (OrbNode i = front; i != null; i = i.next) {
      if (i.center.y > 200){
        PVector appD = i.getDragForce(dCoef);
        i.applyForce(appD.mult(5));
        if (i.center.y > 400){
          i.applyForce(appD.mult(10));
        }
      }
    }    
  }//applyDrag

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
  }

  void display() {
    for (OrbNode i = front; i != null; i = i.next) {
      i.display();
    } // Linked List For Loop with inspiration from Mr. DW and Lucas Zheng
  }//display

  void run(boolean bounce) {
    for (OrbNode i = front; i != null; i = i.next) {
      i.move();
    }
  }//applySprings
}//OrbList
