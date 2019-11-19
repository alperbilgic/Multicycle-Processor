// Copyright (C) 2017  Intel Corporation. All rights reserved.
// Your use of Intel Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Intel Program License 
// Subscription Agreement, the Intel Quartus Prime License Agreement,
// the Intel FPGA IP License Agreement, or other applicable license
// agreement, including, without limitation, that your use is for
// the sole purpose of programming logic devices manufactured by
// Intel and sold by Intel or its authorized distributors.  Please
// refer to the applicable agreement for further details.

// PROGRAM		"Quartus Prime"
// VERSION		"Version 17.1.0 Build 590 10/25/2017 SJ Lite Edition"
// CREATED		"Mon May 13 14:14:37 2019"

module connected(
	clk, RUN, RESET, states
);


input wire	clk, RUN, RESET;

wire RegW, LRW, MemW, IRW, FlagU, rstW, PC_SelW;
wire [1:0] AdrSrcW, ALUSrcBW, ImmSrcW, RegSrcW, ResultSrcW;
wire [2:0] ALUControlW, PCWriteW, ShftDcdW;


wire [19:0] instructions;
wire [3:0] flags;

output wire [3:0] states;



controller	b2v_inst(
	
	.clk(clk),
	
	.rst(rstW),
	.RegWrite(RegW),
	.LRWrite(LRW),
	.MemWrite(MemW),
	.IRWrite(IRW),
	.FlagUp(FlagU),
	.PC_Sel(PC_SelW),
	.AdrSrc(AdrSrcW),
	.ALUSrcB(ALUSrcBW),
	.ImmSrc(ImmSrcW),
	.RegSrc(RegSrcW),
	.ResultSrc(ResultSrcW),
	.ALUControl(ALUControlW),
	.PCWrite(PCWriteW),
	.ShftDcd(ShftDcdW),
	.instructi(instructions),
	.flags(flags),
	.states(states),
	.RUN(RUN),
	.RESET(RESET)
	
	);


fourthData	b2v_inst1(

	.clk(clk),
	
	.rst(rstW),
	.RegWrite(RegW),
	.LRWrite(LRW),
	.MemWrite(MemW),
	.IRWrite(IRW),
	.FlagUp(FlagU),
	.PC_Sel(PC_SelW),
	.AdrSrc(AdrSrcW),
	.ALUSrcB(ALUSrcBW),
	.ImmSrc(ImmSrcW),
	.RegSrc(RegSrcW),
	.ResultSrc(ResultSrcW),
	.ALUControl(ALUControlW),
	.PCWrite(PCWriteW),
	.ShftDcd(ShftDcdW),	
	.instructi(instructions),
	.flags(flags)
	);


endmodule
