module adder (A, out);
	input[7:0] A;
	output[7:0] out;
	assign out = A + 3'b100;
	
endmodule
