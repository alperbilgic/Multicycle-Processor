 module shiftregister #(parameter W = 8) (
	clk,
	in, out,rst, write, SPS, SRL, Sin
);
 	input clk;
	input [W-1:0] in;
	output reg [W-1:0] out;
	input rst;
	input write, Sin, SPS, SRL;

	initial
	begin
		out = {W{1'b0}};
	end

	always @(posedge clk)
	begin
		if (rst)
			out <= {W{1'b0}};
			else if (write) begin
				if (SPS) begin
					out <= in;
				end else begin
					if (SRL) 
						out <= {Sin, out[W-1:1]};
						else 
						out <= {out[W-2:0], Sin};
				end
				
			end
	end
endmodule
