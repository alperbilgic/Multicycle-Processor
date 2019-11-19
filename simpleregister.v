 module simpleregister #(parameter W = 8) (
	clk,
	in, out,rst
);
 	input clk;
	input [W-1:0] in;
	output reg [W-1:0] out;
	input rst;

	initial
	begin
		out = {W{1'b0}};
	end

	always @(posedge clk)
	begin
			out <= in;
		if (rst)
			out <= {W{1'b0}};
	end
endmodule
