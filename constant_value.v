module constant_value #(parameter W = 8, value = 1'd0) (out);
	output wire [W-1:0] out;
	assign out = value;
endmodule
