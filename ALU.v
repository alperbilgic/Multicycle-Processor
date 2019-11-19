module ALU #(parameter W=2)(A,B,I,F,Z,N,C_out,OVF);
	input [(W-1):0] A,B;
	input [2:0] I;
	reg [W-1:0] C;
	output reg [(W-1):0] F;
	output reg Z,N,C_out,OVF;
	
always @(*)
begin
	case(I)
		3'b000 : // Add
		begin
			{C_out, F} = A + B ;
			N = F[W-1];
			Z = 0;
			if(F==0) begin
				Z=1;
				end
			if((A[W-1]==1 && B[W-1] == 1 && F[W-1] == 0) || (A[W-1]==0 && B[W-1] == 0 && F[W-1] == 1)) begin
				OVF=1;
				end
			else begin
				OVF=0;
				end
		end
			
		3'b001 : // SubAB
		begin
			{C_out,F} = {1'b0, A}+{1'b0, ~B+1};
			if (A[W-1] ==1 && B[W-1]==0) begin
				C_out = 1;
				end
			if (A[W-1] ==0 && B[W-1]==1) begin
				C_out = 0;
				end
			N = F[W-1];
			Z = 0;
			if(F==0) begin
				Z=1;
				end
			if((A[W-1]==1 && B[W-1] == 0 && F[W-1] == 0) || (A[W-1]==0 && B[W-1] == 1 && F[W-1] == 1)) begin
				OVF = 1;
				end
			else begin
				OVF = 0;
				end
			
		end
		
		3'b010 : // SubBA
		begin
			{C_out,F} = {1'b0, B}+{1'b0, ~A+1};
			if (A[W-1] ==0 && B[W-1]==1) begin
				C_out = 1;
				end
			if (A[W-1] ==1 && B[W-1]==0) begin
				C_out = 0;
				end
			N = F[W-1];
			Z = 0;
			if(F==0) begin
				Z=1;
				end
			if((A[W-1]==0 && B[W-1] == 1 && F[W-1] == 0) || (A[W-1]==1 && B[W-1] == 0 && F[W-1] == 1)) begin
				OVF = 1;
				end
			else begin
				OVF = 0;
				end
			
		end
		
		3'b011 : // bit clear
		begin
			F = A & (~B);
			N = F[W-1];
			if(F==0) begin
				Z = 1;
				end
				else begin
				Z = 0;
				end
			C_out = 0;
			OVF = 0;
		end
		
		3'b100 : // and
		begin
			F = A & B;
			N = F[W-1];
			if(F==0) begin
				Z = 1;
				end
				else begin
				Z = 0;
				end
			
			C_out = 0;
			OVF = 0;
		end
		
		3'b101 : // or
		begin
			F = A | B;
			N = F[W-1];
			if(F==0) begin
				Z = 1;
				end
				else begin
				Z = 0;
				end
				
			C_out = 0;
			OVF = 0;
		end
		
		3'b110 : // exor
		begin
			F = A ^ B;
			N = F[W-1];
			if(F==0) begin
				Z = 1;
				end
				else begin
				Z = 0;
				end
				
			C_out = 0;
			OVF = 0;
		end
		
		3'b111 :  // exnor
		begin
			F = ~(A ^ B);
			N = F[W-1];
			if(F==0) begin
				Z = 1;
				end
				else begin
				Z = 0;
				end
			C_out = 0;
			OVF = 0;
		end
		
		default: begin 
				F = A+B;
				C_out = 0;
				OVF = 0;
			   N = 0;
				Z = 0;
			end
		
	endcase
end
endmodule
