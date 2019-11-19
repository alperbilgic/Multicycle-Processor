module test_fifth ();

	reg rst, reset;
	reg clk;
	reg RUN, RESET;
	

always
	begin
	clk = 1; RUN=1; #5; clk = 0; #5;
	end


initial begin

	RUN = 1;
	
end
	
	connected dut (.clk(clk), .RUN(RUN), .RESET(RESET));

endmodule
