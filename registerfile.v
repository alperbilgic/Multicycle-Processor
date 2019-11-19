 module registerfile #(parameter W = 32) (
	clk,
	in, out1, out2, rst, WE, Add1, Add2, Add3, LRWrite, PC
);
 	input clk;
	//input [W-1:0] in, R15in;
	input [2:0] Add1, Add2, Add3;
	output wire [W-1:0] out1, out2;
	input rst, LRWrite;
	input WE;
	input [W-1:0] in, PC;
	
	reg [W-1:0] registers [7:0];
	
	assign out1 = registers[Add1[2:0]];
	assign out2 = registers[Add2[2:0]];

initial begin
	registers[0] = 8'h00000000;
	registers[1] = 8'h00000000;
	registers[2] = 8'h00000000;
	registers[3] = 8'h00000000;
	registers[4] = 8'h00000000;
	registers[5] = 8'h00000000;
	registers[6] = 8'h00001000;
	registers[7] = 8'h00000000;
end

always @(posedge clk)
begin
	registers[7] = PC;
	if(LRWrite)
		registers[6] = registers[7] - 3'b100;
	if(WE)
		registers[Add3[2:0]] <= in;
	
end
	
	
endmodule
