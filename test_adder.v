module test_adder ();
 
	reg reset, clk;
	reg [7:0] in;
	
	wire [7:0] OUT;
	
	reg [3:0] vectornum, errors; // bookkeeping variables
	reg [9:0] testvectors[20:0]; // array of testvectors
	
	adder dut (.A(in), .out(OUT));
	
	
	
always
	begin
	clk = 1; #5; clk = 0; #5;
	end
	
initial
	begin
	vectornum = 0; errors = 0;
	reset = 1; #30; reset = 0;
	in = 32'b10000000000000000000000000001010;
end


always @(negedge clk)
	if (~reset) begin // skip during reset
			// increment array index and read next testvector
		vectornum = vectornum + 1;
		if (testvectors[vectornum] === 5'bx) begin
			$display("%d tests completed with %d errors",
			vectornum, errors);
		end
	end
endmodule
