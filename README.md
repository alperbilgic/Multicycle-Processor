# Multicycle-Processor
Verilog Implementation of a simple multicycle processor


This repository presents a Central Process Unit that has multicycle architecture. The main structure is given in fourthData.bdf file. This structure includes several components as different types of registers, multiplexers, an Algorithmic Logic Unit(ALU), RAM, register file, constant value generators and a shifter. 

To simulate the project fourthData.bdf of fourthData.v filesi should be run. I, personally, use ModelSim to have a simulation for tests. A brief explanation for its usage is given in the url https://www.nandland.com/vhdl/tutorials/tutorial-modelsim-simulation-walkthrough.html. Be sure that you added all the modules which fourthData includes and the test file eighter. Quartus was the platform that the developement and the implementstion on the FPGA board is done. Intel provides a tutorial for beginners on Quartus. 

The designed architecture has one memory module that includes data and instructions at the same time. The instructions start at the beginning address and data comes after the end of instructions. At first the instruction register is loaded be zeros. By the end of an instruction, the instruction register is incremented to read the next instruction. 

The instruction set of designed architecture is given below:


A sample code was loaded to the memory for test.
