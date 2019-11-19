# Multicycle-Processor
Verilog Implementation of a simple multicycle processor


This repository presents a Central Process Unit that has multicycle architecture. The main structure is given in fourthData.bdf file. This structure includes several components as different types of Registers, Multiplexers, an Algorithmic Logic Unit(ALU), RAM, Register File, Constant Value Generators and a Shifter. 

To simulate the project truely one of fourthData.bdf or fourthData.v files should be taken out from the project folder. They can be generated from each other. To test the desin, I personally use ModelSim to simulate. A brief explanation for its usage is given in https://www.nandland.com/vhdl/tutorials/tutorial-modelsim-simulation-walkthrough.html. Be sure that you added the test file and all the modules which fourthData files include. Quartus was the platform that the developement and the implementstion on the FPGA board is done. Intel provides a Quartus tutorial for beginners on the official website, https://www.intel.com › www › pdfs › literature. 

The designed architecture has one memory module that includes data and instructions at the same time. The instructions start at the beginning address and data comes after the end of instructions. At first the instruction register is loaded be zeros. By the end of an instruction, the instruction register is incremented to read the next instruction. 

The instruction set of designed architecture is given below:
# Branch Operations

  BUN (Branch Unconditionally)
  BEQ (Branch if Equal)
  BNE (Branch if Not Equal)
  BCE (Branch if zero)
  BCN (Branch if not zero)
  BL  (Branch with link)
  BIL (Branch indirect with link)

# Shift Operations

  LSR (Logic Shift Right)
  LSL (Logical Shift Left)
  ASR (Arithmetic Shift Right)
  CSR (Circular Shift Right)
  CSL (Circular Shift Left)
  
# Memory Operations
  
  MOV (Move immediate value to the register)
  LDR (Load value from one register to another)
  STR (Store value to the given address)
  
# Arithmetic Operations

  ADD (Addition)
  SUB (Subtraction)
  
# Logic Operations

  AND (Bitwise and operation)
  OR  (Bitwise or operation)
  XOR (Bitwise exor operation)
  CLR (Clear)
  
Finding binary equivalent of an instruction



A sample code was loaded to the memory for test. Which can be written in assembly language as follows:

