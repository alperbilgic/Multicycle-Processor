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
// CREATED		"Wed Mar 27 01:17:18 2019"

module total(
	clk,
	rst,
	Regsrc,
	MemWrite,
	regwrite,
	Alusrc,
	MemtoReg,
	ALUcont,
	ImmSrc,
	instr,
	PC,
	RD1,
	RS2,
	ShftDcd,
	WD
);


input wire	clk;
input wire	rst;
output wire	Regsrc;
output wire	MemWrite;
output wire	regwrite;
output wire	Alusrc;
output wire	MemtoReg;
output wire	[2:0] ALUcont;
output wire	[1:0] ImmSrc;
output wire	[31:0] instr;
output wire	[31:0] PC;
output wire	[31:0] RD1;
output wire	[31:0] RS2;
output wire	[1:0] ShftDcd;
output wire	[31:0] WD;

wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	SYNTHESIZED_WIRE_3;
wire	[11:0] SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
wire	SYNTHESIZED_WIRE_6;
wire	SYNTHESIZED_WIRE_7;
wire	SYNTHESIZED_WIRE_8;
wire	SYNTHESIZED_WIRE_9;
wire	[2:0] SYNTHESIZED_WIRE_10;
wire	[1:0] SYNTHESIZED_WIRE_11;
wire	[1:0] SYNTHESIZED_WIRE_12;

assign	Regsrc = SYNTHESIZED_WIRE_5;
assign	MemWrite = SYNTHESIZED_WIRE_6;
assign	regwrite = SYNTHESIZED_WIRE_7;
assign	Alusrc = SYNTHESIZED_WIRE_8;
assign	MemtoReg = SYNTHESIZED_WIRE_9;
assign	ALUcont = SYNTHESIZED_WIRE_10;
assign	ImmSrc = SYNTHESIZED_WIRE_11;
assign	ShftDcd = SYNTHESIZED_WIRE_12;




maincontroller	b2v_inst(
	.N(SYNTHESIZED_WIRE_0),
	.V(SYNTHESIZED_WIRE_1),
	.C(SYNTHESIZED_WIRE_2),
	.Z(SYNTHESIZED_WIRE_3),
	.inst(SYNTHESIZED_WIRE_4),
	.RegSrc(SYNTHESIZED_WIRE_5),
	.MemWrite(SYNTHESIZED_WIRE_6),
	.RegWrite(SYNTHESIZED_WIRE_7),
	.ALUSrc(SYNTHESIZED_WIRE_8),
	.MemtoReg(SYNTHESIZED_WIRE_9),
	.ALUcontrol(SYNTHESIZED_WIRE_10),
	.ImmSrc(SYNTHESIZED_WIRE_11),
	.ShftDcd(SYNTHESIZED_WIRE_12));


third	b2v_inst1(
	.clk(clk),
	.RegSrc(SYNTHESIZED_WIRE_5),
	.MemWrite(SYNTHESIZED_WIRE_6),
	.rst(rst),
	.RegWrite(SYNTHESIZED_WIRE_7),
	.ALUSrc(SYNTHESIZED_WIRE_8),
	.MemtoReg(SYNTHESIZED_WIRE_9),
	.ALUControl(SYNTHESIZED_WIRE_10),
	.ImmSrc(SYNTHESIZED_WIRE_11),
	.ShftDcd(SYNTHESIZED_WIRE_12),
	.N(SYNTHESIZED_WIRE_0),
	.OVF(SYNTHESIZED_WIRE_1),
	.Z(SYNTHESIZED_WIRE_3),
	.C_out(SYNTHESIZED_WIRE_2),
	.DATA_IN(WD),
	.instructi(instr),
	.instruction(SYNTHESIZED_WIRE_4),
	.PC(PC),
	.RD1(RD1),
	.RD2(RS2));


endmodule
