 module writeregister #(parameter W = 8) (
	clk,
	in, out,rst, write
);
 	input clk;
	input [W-1:0] in;
	output reg [W-1:0] out;
	input rst;
	input write;

	initial
	begin
		out = {W{1'b0}};
	end

	always @(posedge clk)
	begin
		if (rst)
			out <= {W{1'b0}};
			else if (write)
			out <= in; 
			else
			out <= out;
	end
endmodule
