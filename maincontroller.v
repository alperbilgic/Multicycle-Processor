module maincontroller (inst, N, V, C, Z, ALUcontrol, RegSrc, MemWrite, ShftDcd, RegWrite, ALUSrc, ImmSrc, MemtoReg);

	input [11:0] inst;
	input N,Z,V,C;
	
	output RegSrc, MemWrite, RegWrite, ALUSrc, MemtoReg;
	output [2:0] ALUcontrol; 
	output [1:0] ShftDcd, ImmSrc;
	
	wire [1:0] op;
	wire [5:0] func;
	wire [3:0] cond;
	
	assign op = inst[7:6];
	assign func = inst[5:0];
	assign cond = inst[11:8];
	
	assign RegWrite = ~op[0] || (op[0] && func[0]);
	
	assign ALUcontrol = {func[3] && (~op[0] && ~func[4]), func[2] && (~op[0] && ~func[4]), func[1] && (~op[0] && ~func[4])} ;
	
	assign RegSrc = (~(op[0] || op[1]) && func[4]) || (op[0] && (~func[0]));
	
	assign MemWrite = op[0] && ~func[0];
	assign ShftDcd = { (~(op[0] || op[1])) && func[4] && (~(func[3] || func[2] || func[1])), (~(op[0] || op[1])) && func[4] && (~func[3]) && (~func[2]) && (func[1]) };
	
	assign ALUSrc = op[0];
	
	assign ImmSrc = { 1'b0 , op[0]};
	
	assign MemtoReg = op[0] && func[0];
	
endmodule
