module muxtwo #(parameter w = 8) ( ina, inb, sel, out );
	input[ w-1:0] ina, inb;
	output [ w-1:0] out;
	input sel;
	
	assign out = sel ? inb : ina;
endmodule
