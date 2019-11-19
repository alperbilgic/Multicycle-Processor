module controller ( states, RUN, RESET, clk, rst, flags, instructi, RegWrite, LRWrite, MemWrite, IRWrite, FlagUp, AdrSrc, ALUControl, ALUSrcB, ImmSrc, PCWrite, RegSrc, ResultSrc, ShftDcd, PC_Sel);
	
	input [3:0] flags;
	input [19:0] instructi;
	input clk;
	input RUN, RESET;
	
	output reg RegWrite, LRWrite, MemWrite, IRWrite, FlagUp, PC_Sel;
	output reg [2:0] ALUControl, PCWrite, ShftDcd;
	output reg [1:0] AdrSrc, ALUSrcB, ImmSrc, RegSrc, ResultSrc;
	output reg [3:0] states;
	output reg rst;
	reg [3:0] nextState;
	
	wire [1:0] op;
	wire [3:0] func;
	
	assign op = instructi[19:18];
	assign func = instructi[17:14];
	
initial begin
	states = 4'b0000;
end
	
always @(posedge clk) begin

	if (RUN)
		states <= nextState;
	else 
		states <= states;
	

end
	
always @(states, instructi) begin
	ALUControl = 3'b000;
	RegWrite = 1'b0;
	LRWrite = 1'b0;
	MemWrite = 1'b0;
	IRWrite = 1'b0;
	FlagUp = 1'b0;
	PC_Sel = 1'b1;
	PCWrite = 3'b000;
	ShftDcd = 3'b000;
	AdrSrc = 2'b00;
	ALUSrcB = 2'b10; 	// picked constant zero for each time unless the current state requires a different one
	ImmSrc = 2'b00;
	ResultSrc = 2'b00;
	rst = 1'b0;
	if (RESET) begin
		rst = 1'b1;
		nextState = 4'b0000;
	end else begin
	
		case(states)
		4'b0000:
			begin
				IRWrite = 1'b1;
				ALUSrcB = 2'b10;
				PCWrite = 3'b101;
				ResultSrc = 2'b10;
				PC_Sel = 1'b1;
				nextState = 4'b0001;
			end
		4'b0001: 
			begin
				RegSrc = 2'b00;
				if ( op == 2'b01) begin
					nextState = {op, func[3:2]};
				end else if (op == 2'b00) begin
						nextState = { 3'b001 , func[3]};
					end else if ( op == 2'b10) begin
						nextState = { 3'b100, func[3]};
					end else if ( op == 2'b11) begin
						nextState = 4'b1111;
					end
			end
		4'b0010:	// shift state 
			begin
				ALUSrcB = 2'b10;	// constant zero is selected
				ShftDcd = func[2:0];
				nextState = 4'b1010;
			end
		4'b0011: // arithmetic & logic operation state
			begin
				FlagUp = 1'b1;
				ALUControl = func[2:0];
				ALUSrcB = 2'b00;	// register is selected
				nextState = 4'b1010;
			end
		4'b1010:	// second state for shift and Arith. & logic
			begin
				RegWrite = 1'b1;
				ALUSrcB = 2'b10;
				nextState = 4'b0000;
			end
		4'b0100: // LDR Reg, #Imm
			begin
				AdrSrc = 2'b10;
				ALUSrcB = 2'b10;
				nextState = 4'b1100;
			end
		4'b1100: // LDR second cycle
			begin
				RegWrite = 1'b1;
				ALUSrcB = 2'b10;
				RegSrc = 2'b10;
				ResultSrc = 2'b01;
				nextState = 4'b0000;
			end
		4'b0101: // MOV Reg, #Imm
			begin
				RegWrite = 1'b1;
				ALUSrcB = 2'b10;
				RegSrc = 2'b10;
				ResultSrc = 2'b11;
				nextState = 4'b0000;
			end
		4'b0110: // STR Reg, #Imm
			begin
				ALUSrcB = 2'b01;
				RegSrc = 2'b10;
				nextState = 4'b1101;
			end
		4'b1101: // STR second
			begin
				MemWrite = 1'b1;
				AdrSrc = 2'b10;
				ALUSrcB = 2'b01;
				RegSrc = 2'b10;
				nextState =  4'b0000;
			end
		4'b1000: // Branches  
			begin
				nextState = 4'b0000;
				PCWrite = func[2:0];
				LRWrite = func[2] && (~func[1]) && func[0];
				ALUSrcB = 2'b01;
				RegSrc = 2'b10;
				ResultSrc = 2'b10;
				PC_Sel = 1'b0;
			end
		
		4'b1001: // Branch to link 1
			begin 
				nextState = 4'b1011;
				ALUSrcB = 2'b01;
				RegSrc = 2'b10;
				ResultSrc = 2'b10;	
			end
		4'b1011: // Branch to link 2
			begin
				PCWrite = 3'b101;
				nextState = 4'b0000;
				ALUSrcB = 2'b10;
				ResultSrc = 2'b10;
				PC_Sel = 1'b0;
			end
		4'b1111: // END state
			begin
				rst = 1'b1;
				nextState = 4'b1111; // an infinite loop
			end
		
		endcase
	end
end
	
	
endmodule
