module muxsixteen #(parameter w = 32) ( ina, inb, inc, ind, ine, inf, ing, inh, ini, inj, ink, inl, inm, inn, ino, inp, sel, out );
	input[ w-1:0] ina, inb, inc, ind, ine, inf, ing, inh, ini, inj, ink, inl, inm, inn, ino, inp;
	output [ w-1:0] out;
	input[3:0] sel;
	
	wire [w-1:0] connect1, connect2, connect3, connect4;
	
	muxfour #(.w(w)) mux1(.ina(ina), .inb(inb), .inc(inc), .ind(ind), .out(connect1), .sel(sel[1:0]));
	muxfour #(.w(w)) mux2(.ina(ine), .inb(inf), .inc(ing), .ind(inh), .out(connect2), .sel(sel[1:0]));
	muxfour #(.w(w)) mux3(.ina(ini), .inb(inj), .inc(ink), .ind(inl), .out(connect3), .sel(sel[1:0]));
	muxfour #(.w(w)) mux4(.ina(inm), .inb(inn), .inc(ino), .ind(inp), .out(connect4), .sel(sel[1:0]));
	muxfour #(.w(w)) mux5(.ina(connect1), .inb(connect2), .inc(connect3), .ind(connect4), .out(out), .sel(sel[3:2]));
	
endmodule
