[![Review Assignment Due Date](https://classroom.github.com/assets/deadline-readme-button-22041afd0340ce965d47ae6ef1cefeee28c7c493a6346c4f15d667ab976d596c.svg)](https://classroom.github.com/a/gbHItYk9)
## Project 00
### NeXTCS 
### Period: 10 
## Name0: Clayton Zhu
## Name1: Avery Wenger 
---

This project will be completed in phases. The first phase will be to work on this document. Use github-flavoured markdown. (For more markdown help [click here](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet) or [here](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax) )

All projects will require the following:
- Researching new forces to implement.
- Method for each new force, returning a `PVector`  -- similar to `getGravity` and `getSpring` (using whatever parameters are necessary).
- A distinct demonstration for each individual force (including gravity and the spring force).
- A visual menu at the top providing information about which simulation is currently active and indicating whether movement is on or off.
- The ability to toggle movement on/off
- The ability to toggle bouncing on/off
- The user should be able to switch _between_ simluations using the number keys as follows:
  - `1`: Gravity
  - `2`: Spring Force
  - `3`: Drag
  - `4`: Custom Force
  - `5`: Combination


## Phase 0: Force Selection, Analysis & Plan
---------- 

#### Custom Force: Centripetal Force, Collisions

### Forumla
What is the formula for your force? Including descriptions/definitions for the symbols. (You may include a picture of the formula if it is not easily typed.)


![Screenshot 2025-03-24 at 15-11-23 centripetal force - Wikipedia](https://github.com/user-attachments/assets/4cb5bffe-6e63-4b42-8e27-a6f4b05d584f)
F is the force <br>
m is the mass <br>
v^2 is the velocity squared <br>
r is the radius <br>
r hat is the unit vector from the center <br>




### Custom Force
- What information that is already present in the `Orb` or `OrbNode` classes does this force use?
  - mass, velocity

- Does this force require any new constants, if so what are they and what values will you try initially?
  - The distance between the center of centripetal force and the orb going around, r
  - The normalized vector of r, r^2

- Does this force require any new information to be added to the `Orb` class? If so, what is it and what data type will you use?
  - N/A

- Does this force interact with other `Orbs`, or is it applied based on the environment?
  - It interacts with other orbs

- In order to calculate this force, do you need to perform extra intermediary calculations? If so, what?
  - Yes: F<sub>c</sub> =  m * a<sub>c</sub> with a<sub>c</sub> = v<sup>2</sup>/r 

--- 

### Simulation 1: Gravity
Describe how you will attempt to simulate orbital motion.

Two orbs placed randomly with the only forces acting on them being each other's gravitational pull

--- 

### Simulation 2: Spring
Describe what your spring simulation will look like. Explain how it will be setup, and how it should behave while running.

Two orbs are placed vertically. The higher orb can move only about the x-axis, while the lower orb can move about the x-axis and y-axis. For the purpose of demonstration, the length of the spring is finite. 

--- 

### Simulation 3: Drag
Describe what your drag simulation will look like. Explain how it will be setup, and how it should behave while running.

An orb will be dropped and gravity will pull it down. There will be a white and blue area of the screen, the blue area activates the drag and thus should slow the orb down.

--- 

### Simulation 4: Momentum and/or Centripetal force
Describe what your Custom force simulation will look like. Explain how it will be setup, and how it should behave while running.

#### Centripetal Force: Have the orbs orbit around the sun with their centripetal force keeping them from falling in
#### Momentum: Ball Collision and then showing resulting accelerations

--- 

### Simulation 5: Combination
Describe what your combination simulation will look like. Explain how it will be setup, and how it should behave while running.

Building onto simulation 4 but now there can be "asteroids" that collide with planets with drag also being active.


