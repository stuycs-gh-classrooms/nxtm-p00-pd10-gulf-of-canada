#New README

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
  - None

- Does this force require any new constants, if so what are they and what values will you try initially?
  - None

- Does this force require any new information to be added to the `Orb` class? If so, what is it and what data type will you use?
  - float maxSpeed prevents the orbs from disappearing when user sets the speed to very large number
  - boolean demo5Gravity is used in demo 5 where the orbs are randomly assigned either centripetal or gravity force, this Boolean is used to track 

- Does this force interact with other `Orbs`, or is it applied based on the environment?
  - It interacts with a fixedOrb at the center

- In order to calculate this force, do you need to perform extra intermediary calculations? If so, what?
  - Yes: F<sub>c</sub> =  m * a<sub>c</sub> with a<sub>c</sub> = v<sup>2</sup>/r 

--- 

### Simulation 1: Gravity
Describe how you will attempt to simulate orbital motion.

10 orbs are randomly placed upon the screen with an earth gravity way below the screen. The orbs will all straight down.

--- 

### Simulation 2: Spring
Describe what your spring simulation will look like. Explain how it will be setup, and how it should behave while running.

10 orbs are randomly placed with a spring linking them to two other orbs, except the start and end node. The orbs should move towards and away from each other, generally chaotic motion.

--- 

### Simulation 3: Drag
Describe what your drag simulation will look like. Explain how it will be setup, and how it should behave while running.

10 orbs are randomly placed with the same gravity in demo 1 being applied. There are two sections on the screen: the red section with the blue slowing down the orb even further.
--- 

### Simulation 4: Centripetal force
Describe what your Custom force simulation will look like. Explain how it will be setup, and how it should behave while running.

10 orbs are randomly placed on screen with a fixedOrb in the center. There is a line that connects the orbs to the fxedOrb. Initially the orbs will stay still but when the mouse is pressed, tangential velocity from the fixedOrb to this orb is applied to the orb. Despite the tangential force being applied in one direction, the orb moves circularly. If moving too fast, the orbs should get further from the fixedOrb.

--- 

### Simulation 5: Combination
Describe what your combination simulation will look like. Explain how it will be setup, and how it should behave while running.

10 orbs are randomly placed on the screen with a fixedOrb in the center. The 10 orbs are randomly assigned to have either centripetal or gravity applied to them. Centripetal force functions the same in demo 4. Gravity, in this demo, is applied between the gravity-assigned orbs and the fixedOrb; these orbs should go in a back-and-forth motion around the fixedOrb with them moving faster when closer.


