class OrbList {

  OrbNode front;

  /*===========================
   Contructor
   Does very little.
   You do not need to modify this method.
   =========================*/
  OrbList() {
    front = null;
  }//constructor

  /*===========================
   addFront(OrbNode o)
   
   Insert o to the beginning of the list.
   =========================*/
  void addFront(OrbNode o) {
    if (front != null) {
      while (front.previous != null) {
        front = front.previous;
      } //while loop to get to front of the list(WLFOL), used repeatedly throughout
      front.previous = o; //change backwards pointer
      o.next = front; //new frontmost
      front = front.previous; //change forwards pointer
    }
  }//addFront


  /*===========================
   populate(int n, boolean ordered)
   
   Clear the list.
   Add n randomly generated  orbs to the list,
   using addFront.
   If ordered is true, the orbs should all
   have the same y coordinate and be spaced
   SPRING_LEGNTH apart horizontally.
   =========================*/
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

  /*===========================
   display(int springLength)
   
   Display all the nodes in the list using
   the display method defined in the OrbNode class.
   =========================*/
  void display() {
    while (front.previous != null) {
      front = front.previous;
    } //WLFOL
    while (front != null) {
      front.display(); //display
      if (front.next == null) {
        break;
      } //if set front to null, then basically deleting linked list
      else {
        front = front.next;
        //if (front == null) {print("Becomes nulls");}
      } //iterate otherwise
    }
  }//display

  /*===========================
   applySprings(int springLength, float springK)
   
   Use the applySprings method in OrbNode on each
   element in the list.
   =========================*/
  void applySprings(int springLength, float springK) {
    while (front.previous != null) {
      front = front.previous;
    } //WLFOL
    while (front != null) {
      front.applySprings(springLength, springK); //apply spring force
      if (front.next == null) {
        break;
      } //already explained architecture (AEA)
      else {
        front = front.next;
      } //AEA
    }
  }//applySprings

  /*===========================
   applyGravity(Orb other, float gConstant)
   
   Use the getGravity and applyForce methods
   to apply gravity crrectly.
   =========================*/
  void applyGravity(Orb other, float gConstant) {
    while (front.previous != null) {
      front = front.previous;
    } //WLFOL
    while (front != null) {
      PVector appG = front.getGravity(other, gConstant);
      front.applyForce(appG); // apply Earth gravity
      if (front.next == null) {
        break;
      } //AEA 
      else {
        front = front.next;
      } //AEA
    }
  }//applySprings

  /*===========================
   run(boolean bounce)
   
   Call run on each node in the list.
   =========================*/
  void run(boolean boucne) {
    while (front.previous != null) {
      front = front.previous;
    }//WLFOL
    while (front != null) {
      front.move(bounce); //Makes orbs move
      if (front.next == null) {
        break;
      } //AEA
      else {
        front = front.next;
      } //AEA
    }
  }//applySprings

  /*===========================
   removeFront()
   
   Remove the element at the front of the list, i.e.
   after this method is run, the former second element
   should now be the first (and so on).
   =========================*/
  void removeFront() {
    while (front.previous != null) {
      front = front.previous;
    } //WLFOL

    if (front.next != null) {
      front = front.next; //change forward pointer
      front.previous = null; //deleting
    }
  }//removeFront


  /*===========================
   getSelected(float x, float y)
   
   If there is a node at (x, y), return
   a reference to that node.
   Otherwise, return null.
   
   See isSlected(float x, float y) in
   the Orb class (line 115).
   =========================*/
  OrbNode getSelected(float x, float y) {
    while (front.previous != null) {
      front = front.previous;
    } //WLFOL
    while (front != null) {
      if (front.isSelected(x, y)) {
        //print("front: " + front);
        return front;
      }  //return front 
      else if (front.next == null) {
        break;
      } //AEA
      else {
        front = front.next;
      }
    } //AEA
    return null;
  }//getSelected

  /*===========================
   removeNode(OrbNode o)
   
   Removes o from the list. You can
   assume o is an OrbNode in the list.
   You cannot assume anything about the
   position of o in the list.
   =========================*/
  void removeNode(OrbNode o) {
    if (o.previous == null) {
      if (o.next != null) {
        o = o.next;
      } //checking next
      if (o.previous != null) {
        o.previous = null;
      } //checking previous
    } // remove first orb 
    else if (o.next == null) {
      if (o.previous != null) {
        o = o.previous;
      } //checking previous
      if (o.next != null) {
        o.next = null;
      } //checking next
    } //remove last orb
    else {
      o.previous.next = o.next; //changing forward pointer
      o.next.previous = o.previous; //changing backwards pointer
    } //if between two orbs 
  }
}//OrbList
