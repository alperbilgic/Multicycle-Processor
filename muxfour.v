module muxfour #(parameter w = 8) ( ina, inb, inc, ind, sel, out );
	input[ w-1:0] ina, inb, inc, ind;
	output [ w-1:0] out;
	input[1:0] sel;
	
	assign out = sel[1] ? (sel[0] ? ind : inc) : (sel[0] ? inb : ina);
	
endmodule
