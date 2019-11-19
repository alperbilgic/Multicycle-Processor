module test_fourthData ();
	reg rst, reset;
	reg clk;
	reg RegWrite;
	reg LRWrite;
	reg MemWrite;
	reg IRWrite;
	reg ALUSrcA;
	reg FlagUp;
	reg PC_Sel;
	reg [1:0] AdrSrc;
	reg [2:0] ALUControl;
	reg [1:0] ALUSrcB;
	reg [1:0] ImmSrc;
	reg [2:0] PCWrite;
	reg [1:0] RegSrc;
	reg [1:0] ResultSrc;
	reg [2:0] ShftDcd;
	wire PCWr;
	wire	Z;
	wire	N;
	wire	C_out;
	wire	OVF;
	wire [3:0] flags;
	wire	[19:0] instructi;
	wire	[7:0] PCout;
	wire	[7:0] RD1;
	wire	[7:0] RD2;
	wire	[7:0] WD;
	wire 	[7:0] ALU;
	wire	[19:0] ram_out;
	
	fourthData dut (rst,
	clk,
	RegWrite,
	LRWrite,
	MemWrite,
	IRWrite,
	FlagUp,
	PC_Sel,
	AdrSrc,
	ALUControl,
	ALUSrcB,
	ImmSrc,
	PCWrite,
	RegSrc,
	ResultSrc,
	ShftDcd,
	Z,
	N,
	C_out,
	OVF,
	PCWr,
	ALU,
	flags,
	instructi,
	PCout,
	ram_out,
	RD1,
	RD2,
	WD
	);
	
	reg [5:0] vectornum, errors;
	reg [26:0] testvectors[40:0];
	
always
	begin
	clk = 1; #5; clk = 0; #5;
	end
	
// initial block for the beginning of the test
initial
	begin
		$readmemb("test_fourthData.tv", testvectors); // maybe memh for hex
		vectornum = 0; errors = 0;
		reset = 1;
		rst = 1;
		#32;
		rst = 0;
		reset = 0;
	end
	
	// apply test vectors on rising edge of clk
always @(posedge clk)
	begin
		#1; {RegWrite, LRWrite, MemWrite, IRWrite, ALUSrcA, FlagUp, AdrSrc, ALUControl, ALUSrcB, ImmSrc, PCWrite, RegSrc, ResultSrc, ShftDcd, PC_Sel} = testvectors[vectornum];
	end
	

always @(negedge clk) begin
	if (~reset)
		vectornum = vectornum + 1;
end

endmodule
