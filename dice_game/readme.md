# Dice Game
This project implements a hardware-based version of a Craps-style Dice Game using digital design concepts. Two cyclic counters (1–6) simulate dice rolls, and control logic determines win/lose conditions.
---
## Game Rules
The game involves two dice, each of which can have a value between 1 and 6. Two counters are used
to simulate the roll of the dice. Each counter counts in the sequence 1, 2, 3, 4, 5, 6, 1, 2, . . . . Thus,
after the “roll” of the dice, the sum of the values in the two counters will be in the range 2 through 12.
The rules of the game are as follows:
1. After the first roll of the dice, the player wins if the sum is 7 or 11. The player loses if the sum is 2, 3,
or 12. Otherwise, the sum the player obtained on the first roll is referred to as a point, and he or she
must roll the dice again.
2. On the second or subsequent roll of the dice, the player wins if the sum equals the point, and he or
she loses if the sum is 7. Otherwise, the player must roll again until he or she finally wins or loses.

---

## Design Overview

### DiceGame Module
- Accepts `Rb` (Roll Begin) signal  
- Receives `Sum` input  
- Stores first roll as **Point** (if required)  
- Generates `Win` or `Lose` signals  
- Implemented using FSM and control logic  

### GameTest Module

Instead of a traditional passive testbench, this project uses an active `GameTest` module.

###  Why GameTest Instead of a Traditional Testbench?

A normal testbench:
- Applies predefined inputs
- Does not dynamically respond to outputs

`GameTest`:
- Waits for the `Roll` signal
- Supplies `Sum` only when requested
- Repeats rolling if no Win/Lose occurs
- Automatically resets after game completion

This makes verification:
- More realistic  
- Event-driven  
- Closer to real hardware interaction  

---

##  Concepts Used

- Finite State Machine (FSM)  
- Sequential & combinational logic  
- Registers for storing Point  
- Counter-based dice simulation  
- Event-driven verification  

---

## 🚀 Learning Outcomes

- Designing rule-based hardware systems  
- Implementing multi-state control logic  
- Writing structured verification modules  
- Understanding dynamic test environments  
