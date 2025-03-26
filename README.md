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

#### Custom Force: Centripetal Force

### Forumla
What is the formula for your force? Including descriptions/definitions for the symbols. (You may include a picture of the formula if it is not easily typed.)


![Screenshot 2025-03-24 at 15-11-23 centripetal force - Wikipedia](https://github.com/user-attachments/assets/4cb5bffe-6e63-4b42-8e27-a6f4b05d584f) <br>
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
  - Minimum and maximum string length, both of which will be floats

- Does this force interact with other `Orbs`, or is it applied based on the environment?
  - It interacts with other orbs

- In order to calculate this force, do you need to perform extra intermediary calculations? If so, what?
  - Yes: F<sub>c</sub> =  m * a<sub>c</sub> with a<sub>c</sub> = v<sup>2</sup>/r 

--- 

### Simulation 1: Gravity
Describe how you will attempt to simulate orbital motion.

Two orbs placed randomly with the only forces acting on them being each other's gravitational pull. The two orbs should keep moving back and forth.

--- 

### Simulation 2: Spring
Describe what your spring simulation will look like. Explain how it will be setup, and how it should behave while running.

Two orbs are placed vertically. The higher orb is fixed and the lower orb can only be moved in the y-xais. Earth will be off the screen and gravity will be presnt. For the purpose of demonstration, the length of the spring is finite. As the lower orb reaches the maximum spring length, it should bounce back up. This effect is dampened each time until the orb stops moving.

--- 

### Simulation 3: Drag
Describe what your drag simulation will look like. Explain how it will be setup, and how it should behave while running.

An orb will be dropped and gravity will pull it down. There will be a white, red and blue area of the screen, the red area activates minimal drag, and the blue area activates substantial drag and thus should slow the orb down.

--- 

### Simulation 4: Centripetal force
Describe what your Custom force simulation will look like. Explain how it will be setup, and how it should behave while running.

Create a fixed orb connected to an orb. When the orb is not moving, the string should be at its minimum length. As velocity is added tangentially to the string, the orb will revolve around the fixed orb and the string should extend until it reaches its maximum length

--- 

### Simulation 5: Combination
Describe what your combination simulation will look like. Explain how it will be setup, and how it should behave while running.

Combining: gravity, drag, and centripetal force<br> 
A fixed orb will be centered on-screen with its gravity acting on an orbiting orb. The orbiting orb's velocity will slowly increase tangentially to the force of gravity, eventually spinning further and further away as the velocity of the orbiting orb overcomes the force of gravity. All of thsi happens as drag is acting.



