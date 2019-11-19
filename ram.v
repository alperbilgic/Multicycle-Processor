module ram(
	clk,
	addr,
	out,
	w,
	in
);
	input clk, w;
	input [7:0] addr;
	output [19:0] out;

	input [7:0] in;

	reg [19:0] memory [200:0];

initial begin
	
	memory[0] = 20'b01000000100101010000; // LDR R1, 5
	memory[4] = 20'b01000000000001010100;   // LDR R0, 2
	memory[8] = 20'b01000100000100011010;	// STR 
	memory[12] = 20'b00110001001100000111;	// ROL
	memory[16] = 20'b00001001110000000010;	// AND
	memory[20] = 20'b10010111111100010000;	//BL to [40]	2's comp
	memory[24] = 20'b10010111111100110100;	//BL to [80]	sum array
	memory[28] = 20'b10010111111101011000;	//BL to [120]  evenness/oddity
	memory[32] = 20'b11000000000000000000;	// END instruction
	
	memory[40] = 20'b01010000000000000000;	// MOV R0, #0
	memory[44] = 20'b01010000100100010101;	// MOV R1, #25
	memory[48] = 20'b00100100000000000001;	// SUB R0, R0, R1
	memory[52] = 20'b10100011011000000000;	// BX  LR
	
	
	memory[80] = 20'b01000000000010100100;	// LDR R0, #164
	memory[84] = 20'b01000000100110101000;	// LDR R0, #168
	memory[88] = 20'b00100000100000000000;	// ADD R0, R0, R1
	memory[92] = 20'b01000000100110101100;	// LDR R0, #172
	memory[96] = 20'b00100000100000000000;	// ADD R0, R0, R1
	memory[100] = 20'b01000000100110110000;	// LDR R0, #176
	memory[104] = 20'b00100000100000000000;	// ADD R0, R0, R1
	memory[108] = 20'b01000000100110110100;	// LDR R0, #180
	memory[112] = 20'b00100000100000000000;	// ADD R0, R0, R1
	memory[116] = 20'b10100011011000000000;	// BX  LR
	
	
	memory[120] = 20'b01010000000001010101;	// MOV R0, #88
	memory[124] = 20'b00010100000100000111;	// LSL R1, R0, #7
	memory[128] = 20'b01010001001010000000;	// MOV R2, #128
	memory[132] = 20'b00100100100100000010;	// SUBS R1, R1, R2
	memory[136] = 20'b10001011111100001100; 	// BEQ branch
	memory[140] = 20'b00010100000000000100; 	// LSL R0, #4
	memory[144] = 20'b00001100000000000001; 	// ROR R0, #1
	memory[148] = 20'b10000111111100001000; 	// BUN end
	memory[152] = 20'b00000100000000000001; 	// LSR R0, #1
	memory[156] = 20'b00010000000000000100; 	// ROL R0, #4
	memory[160] = 20'b10100011011000000000;	// BX  LR
	
	
	memory[164] = 20'b00000000000000001000;	// array elements are loaded to these locations
	memory[168] = 20'b00000000000000000110;
	memory[172] = 20'b00000000000000000100;
	memory[176] = 20'b00000000000000000010;
	memory[180] = 20'b00000000000000000000;
	
end

	assign out = memory[addr]; 
	
	always @(posedge clk) begin
	if (w)
		memory[addr] <= {12'b000000000000 ,in};
		
	
	end
endmodule
