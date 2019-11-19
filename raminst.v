module raminst #(parameter ADDR_WIDTH = 24, DATA_WIDTH = 8) (
	clk,
	addr,
	 out
);
	input clk;
	input [ADDR_WIDTH-1:0] addr;
	output [31:0] out;
	
	reg [31:0] memory [63:0];
	
initial begin
	
	memory[0] = 32'b11110100000100010011000000000101;
	memory[4] = 32'b11110100000100110001000000000111;
	memory[8] = 32'b11110100000000000001000000000000;
	memory[12] = 32'b11110100000100001100000000000000;
	memory[16] = 32'b11110010001100110001000000001100;
	memory[20] = 32'b11110001001100010101000000000010;
	
	
end

	

	assign out = memory[addr];


endmodule
