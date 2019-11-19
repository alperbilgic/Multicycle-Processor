module test_shift ();
 
	reg reset, clk;
	reg [31:0] in;
	reg [31:0] shiftVal;
	reg [3:0] command;
	
	wire [31:0] OUT;
	
	reg [3:0] vectornum, errors; // bookkeeping variables
	reg [9:0] testvectors[20:0]; // array of testvectors
	
	shift dut (.in(in), .out(OUT), .command(command), .shiftVal(shiftVal));
	
	
	
always
	begin
	clk = 1; #5; clk = 0; #5;
	end
	
initial
	begin
	vectornum = 0; errors = 0;
	reset = 1; #30; reset = 0;
	command = 3'b000;
	shiftVal = 8'h00000003;
	in = 32'b10000000000000000000000000001010;
end


always @(negedge clk)
	if (~reset) begin // skip during reset
			// increment array index and read next testvector
		vectornum = vectornum + 1;
		command = command +1;
		if (testvectors[vectornum] === 5'bx) begin
			$display("%d tests completed with %d errors",
			vectornum, errors);
		end
	end
endmodule
