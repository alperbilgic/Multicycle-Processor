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
// CREATED		"Wed Mar 27 01:30:26 2019"

module third(
	RegSrc,
	MemWrite,
	MemtoReg,
	ALUSrc,
	rst,
	clk,
	RegWrite,
	ALUControl,
	ImmSrc,
	ShftDcd,
	Z,
	N,
	C_out,
	OVF,
	DATA_IN,
	instructi,
	instruction,
	PC,
	RD1,
	RD2
);


input wire	RegSrc;
input wire	MemWrite;
input wire	MemtoReg;
input wire	ALUSrc;
input wire	rst;
input wire	clk;
input wire	RegWrite;
input wire	[2:0] ALUControl;
input wire	[1:0] ImmSrc;
input wire	[1:0] ShftDcd;
output wire	Z;
output wire	N;
output wire	C_out;
output wire	OVF;
output wire	[31:0] DATA_IN;
output wire	[31:0] instructi;
output wire	[11:0] instruction;
output wire	[31:0] PC;
output wire	[31:0] RD1;
output wire	[31:0] RD2;

wire	[31:0] instr;
wire	[31:0] SYNTHESIZED_WIRE_0;
wire	[31:0] SYNTHESIZED_WIRE_19;
wire	[31:0] SYNTHESIZED_WIRE_20;
wire	[31:0] SYNTHESIZED_WIRE_21;
wire	[31:0] SYNTHESIZED_WIRE_4;
wire	[31:0] SYNTHESIZED_WIRE_22;
wire	[31:0] SYNTHESIZED_WIRE_23;
wire	[31:0] SYNTHESIZED_WIRE_8;
wire	SYNTHESIZED_WIRE_9;
wire	[31:0] SYNTHESIZED_WIRE_10;
wire	[3:0] SYNTHESIZED_WIRE_12;
wire	[31:0] SYNTHESIZED_WIRE_13;
wire	[31:0] SYNTHESIZED_WIRE_24;

assign	DATA_IN = SYNTHESIZED_WIRE_13;
assign	PC = SYNTHESIZED_WIRE_20;
assign	RD1 = SYNTHESIZED_WIRE_0;
assign	RD2 = SYNTHESIZED_WIRE_22;




shift	b2v_inst(
	.command(ShftDcd),
	.in(SYNTHESIZED_WIRE_0),
	.shiftVal(SYNTHESIZED_WIRE_19),
	.out(SYNTHESIZED_WIRE_21));


adder	b2v_inst1(
	.A(SYNTHESIZED_WIRE_20),
	.out(SYNTHESIZED_WIRE_24));
	defparam	b2v_inst1.W = 32;


ALU	b2v_inst11(
	.A(SYNTHESIZED_WIRE_21),
	.B(SYNTHESIZED_WIRE_4),
	.I(ALUControl),
	.Z(Z),
	.N(N),
	.C_out(C_out),
	
	.F(SYNTHESIZED_WIRE_23));
	defparam	b2v_inst11.W = 32;


muxtwo	b2v_inst12(
	.sel(ALUSrc),
	.ina(SYNTHESIZED_WIRE_22),
	.inb(SYNTHESIZED_WIRE_19),
	.out(SYNTHESIZED_WIRE_4));
	defparam	b2v_inst12.w = 32;


muxtwo	b2v_inst14(
	.sel(MemtoReg),
	.ina(SYNTHESIZED_WIRE_23),
	.inb(SYNTHESIZED_WIRE_8),
	.out(SYNTHESIZED_WIRE_10));
	defparam	b2v_inst14.w = 32;


muxtwo	b2v_inst16(
	.sel(SYNTHESIZED_WIRE_9),
	.ina(SYNTHESIZED_WIRE_10),
	.inb(SYNTHESIZED_WIRE_21),
	.out(SYNTHESIZED_WIRE_13));
	defparam	b2v_inst16.w = 32;


registerfile	b2v_inst18(
	.clk(clk),
	.rst(rst),
	.WE(RegWrite),
	.Add1(instr[15:12]),
	.Add2(instr[19:16]),
	.Add3(SYNTHESIZED_WIRE_12),
	.in(SYNTHESIZED_WIRE_13),
	.out1(SYNTHESIZED_WIRE_0),
	.out2(SYNTHESIZED_WIRE_22));
	defparam	b2v_inst18.W = 32;


adder	b2v_inst19(
	.A(SYNTHESIZED_WIRE_24)
	);
	defparam	b2v_inst19.W = 32;


raminst	b2v_inst2(
	.clk(clk),
	.addr(SYNTHESIZED_WIRE_20),
	.out(instr));
	defparam	b2v_inst2.ADDR_WIDTH = 32;
	defparam	b2v_inst2.DATA_WIDTH = 8;


ram	b2v_inst20(
	.clk(clk),
	.w(MemWrite),
	.addr(SYNTHESIZED_WIRE_23),
	.in(SYNTHESIZED_WIRE_22),
	.out(SYNTHESIZED_WIRE_8));
	defparam	b2v_inst20.ADDR_WIDTH = 32;
	defparam	b2v_inst20.DATA_WIDTH = 32;

assign	SYNTHESIZED_WIRE_9 = ShftDcd[0] ^ ShftDcd[1];


simpleregister	b2v_inst32(
	.clk(clk),
	.rst(rst),
	.in(SYNTHESIZED_WIRE_24),
	.out(SYNTHESIZED_WIRE_20));
	defparam	b2v_inst32.W = 32;


muxtwo	b2v_inst9(
	.sel(RegSrc),
	.ina(instr[3:0]),
	.inb(instr[15:12]),
	.out(SYNTHESIZED_WIRE_12));
	defparam	b2v_inst9.w = 4;


extend	b2v_inst99(
	
	.in(instr[23:0]),
	.out(SYNTHESIZED_WIRE_19));

assign	instructi = instr;
assign	instruction[11:0] = instr[31:20];

endmodule
