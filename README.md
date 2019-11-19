# Multicycle-Processor
Verilog Implementation of a simple multicycle processor


This repository presents a Central Process Unit that has multicycle architecture. The main structure is given in fourthData.bdf file. This structure includes several components as different types of Registers, Multiplexers, an Algorithmic Logic Unit(ALU), RAM, Register File, Constant Value Generators and a Shifter. 

To simulate the project truely one of fourthData.bdf or fourthData.v files should be taken out from the project folder. They can be generated from each other. To test the desin, I personally use ModelSim to simulate. A brief explanation for its usage is given in https://www.nandland.com/vhdl/tutorials/tutorial-modelsim-simulation-walkthrough.html. Be sure that you added the test file and all the modules which fourthData files include. Quartus was the platform that the developement and the implementstion on the FPGA board is done. Intel provides a Quartus tutorial for beginners on the official website, https://www.intel.com › www › pdfs › literature. 

The designed architecture has one memory module that includes data and instructions at the same time. The instructions start at the beginning address and data comes after the end of instructions. At first the instruction register is loaded be zeros. By the end of an instruction, the instruction register is incremented to read the next instruction. 

##Instruction Set
##### Branch Operations

  BUN (Branch Unconditionally)      // Func = 0000
  BEQ (Branch if Equal)             // Func = 0001
  BNE (Branch if Not Equal)         // Func = 0010
  BCE (Branch if zero)              // Func = 0011
  BCN (Branch if not zero)          // Func = 0100
  BL  (Branch with link)            // Func = 0101
  BIL (Branch indirect with link)   // Func = 0111
  BX  (Return from subroutine)      // Func = 1000

##### Shift Operations

  LSR (Logic Shift Right)           // Func = 0001
  LSL (Logical Shift Left)          // Func = 0101
  ASR (Arithmetic Shift Right)      // Func = 0010
  ROR (Rotate Right)                // Func = 0011
  ROL (Rotate Left)                 // Func = 0100
  
##### Memory Operations
  
  MOV (Move immediate value to the register)      // Func = 0000 
  LDR (Load value from one register to another)   // Func = 0010
  STR (Store value to the given address)          // Func = 0001
  
##### Arithmetic Operations

  ADD (Addition)      // Func = 1000
  SUB (Subtraction)   // Func = 1001
  
##### Logic Operations

  AND (Bitwise and operation)   // Func = 1010
  OR  (Bitwise or operation)    // Func = 1011
  EOR (Bitwise exor operation)  // Func = 1100
  CLR (Clear)                   // Func = 1101
  
##Finding Binary Equivalent of an Instruction

Mapping of bits:
  2 Bits | 4 Bits| 3 Bits| 3 Bits|  8 Bits
    OP   | Func  | Reg 1 | Reg 2 | Immediate
    OP: Operation type ( Memory = 01, branch = 10, arithmetic or logic = 00)
    Func: Specific key for instruction (Given above for each instruction)
    Reg 1: Destination register address
    Reg 2: Secondary register address
    Immediate: Immediate value (if needed)

-LDR	R1, [#imm]  (imm -> immediate)
  01_00XX_001_001_00110000

-MOV	R1, #imm
  01_01XX_001_001_00001000

-STR	R1, [#imm]
  01_10XX_001_001_00110000

-SHIFT	R1, R2, #imm  
  00_0[shft]_010_001_00010000   (shft -> type of shift operation)

-AR&LOG	R1, R2, #imm  (Arithmetic & Logic Operations)
  00_1[oper]_010_001_00001100 (oper -> Operation)

-BRA	loop    (Any branch operation BX aside)
  10_0[cond]_ difference  (cond -> Condition, difference -> offset from the instant address of instruction)

-BX	LR
  10_1XXX_XXXXXXXXXXXXXX

-END
  11_XXXX_XXXXXXXXXXXXXX


A sample code was loaded to the memory for test. Which can be written in assembly language as follows:

  MOV R0, #5;
  
  MOV R1, #2;
  
  STR R0, #26;
  
  AND R3, R4;
  
  SUB R0, R0, R1;
  
  BL sub1
  
  BL sub2
  
  BL sub3
  
  END

sub 1   
        
        MOV R0, #0;
        
        MOV R1, #25;
        
        SUB R0, R1;
        
        BX  LR

sub2    
        
        LDR R0, #164;
        
        LDR R1, #168;
        
        ADD R0, R0, R1;
        
        LDR R1, #172;
        
        ADD R0, R0, R1;
        
        LDR R1, #176;
        
        ADD R0, R0, R1;
        
        LDR R1, #180;
        
        ADD R0, R0, R1;

sub3    
        
        MOV R0, #88;
        
        LSL R1, R0;
        
        MOV R2, #12;
        
        SUBS R1, R2;
        
        BEQ ;
        
        LSL R0, #4;
        
        ROR R0, #4;
        
        BUN end
branch  
        
        LSR R0, #1;
        
        ROL R0, #4;
        
end     

        BX  LR
        
