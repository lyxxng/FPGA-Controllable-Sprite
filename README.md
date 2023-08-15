# FPGA-Controllable-Sprite
Final group project for ECE 271 Digital Logic Design

This project displays a sprite of the Pokémon Goomy on a VGA monitor with user-controlled movement and background. The display alternates between four different sprites that change depending on the direction
of movement. The project uses SystemVerilog designs and was verified using a DE10-Lite FPGA Board and VGA monitor.

File layout:
* `Designs` - image of the top-level design and VGA driver created using Intel Quartus Prime Lite
* `Sprites` - images of the hand-drawn sprites and their corresponding Memory Initializtion Files (.mif)[^1]
* `SystemVerilog Files` - all SystemVerilog designs created for the project[^2]

## Project Design
Using Intel Quartus Prime Lite, the SystemVerilog modules were connected through wires in the top-level schematic. The design includes a VGA Driver, with additional modules to control the movement and display
of the sprite. The four ROM blocks were created with Quartus's ROM: 1-PORT in the IP Catalog and the .mif files in `Sprites` for the memory content data.

| ![alt text](https://github.com/lyxxng/FPGA-Controllable-Sprite/blob/main/Designs/quartus_design.jpg "Top-level design for project") | 
|:--:| 
| *Top-level design created using Quartus Prime Lite* |

The design uses an FPGA Board for user and clock input. Six switches provide the RGB input for the background color of the monitor. An additional switch activates the active HIGH reset. The VGA timings use a 25 
MHz pixel clock and the movement operates using an internal 190 Hz clock. Depending on the direction of the sprite (controlled by two switches and two buttons on the FPGA board), one of the following four 
sprites is displayed:

![alt text](https://github.com/lyxxng/FPGA-Controllable-Sprite/blob/main/Sprites/goomy_back.png "Goomy facing backwards")
![alt text](https://github.com/lyxxng/FPGA-Controllable-Sprite/blob/main/Sprites/goomy_front.png "Goomy facing forwards")
![alt text](https://github.com/lyxxng/FPGA-Controllable-Sprite/blob/main/Sprites/goomy_left.png "Goomy facing left")
![alt text](https://github.com/lyxxng/FPGA-Controllable-Sprite/blob/main/Sprites/goomy_right.png "Goomy facing right")

[^1]: The .mif files were created using the [mifMaker repo](https://github.com/p-bodson/mifMaker).
[^2]: This repo only contains SystemVerilog code written by myself and my project parter. It does NOT contain the Verilog files created by Quartus Prime Lite according to the Block Design File. Programming
a DE10-Lite Board with only the files in this repo is not possible.
