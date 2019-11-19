module extend (
	ImmSrc,
	in, out
);
	input [1:0] ImmSrc;
	input [7:0] in;
	output [7:0] out;

	assign out = ImmSrc[1] ? (ImmSrc[0] ? {32'bz} : {in[7], in[7], in[3:0], 2'b00}) : (ImmSrc[0] ? {in[7:0]} : {in[7:0]});

endmodule
