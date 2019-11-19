module shift (in, out, shiftVal, command);

	input signed [2:0] command;
	input signed [7:0] in;
	input signed [7:0] shiftVal;
	output signed [7:0] out;
	wire signed [7:0] cirL;
	wire signed [7:0] cirR;
	wire signed [7:0] temp;
	wire signed [7:0] arth;
	
	assign {cirL, temp} = 	{in, in} << shiftVal;
	
	assign {temp, cirR} = {in, in} >> shiftVal;
	
	assign arth = in >>> shiftVal;
	
	assign out = command[2] ? (command[1] ? (command[0] ? in : in) : (command[0] ? (in << shiftVal) : cirL)) : (command[1] ? (command[0] ? cirR  : arth) : (command[0] ? (in >> shiftVal) : in));

endmodule
