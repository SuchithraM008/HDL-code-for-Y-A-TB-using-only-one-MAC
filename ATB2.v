module ATB2 #(parameter N=8)(A0,A1,A2,A3,B0,B1,B2,B3,clk,rst,start,done,Y);
input [N-1:0]A0,A1,A2,A3;
input [N-1:0]B0,B1,B2,B3;
input clk,rst,start;
output reg done;
output reg [2*N+1:0]Y;
reg [3:0]Count;
reg [2*N+1:0]Temp;
reg [2*N+1:0]A_New;
reg [2*N+1:0]B_New;
wire [4*N+4:0]Temp1;
MAC_Signed #(.N(2*N+2)) MAC_1 (.A(Temp),.B(A_New),.C(B_New),.Y(Temp1));
always @(posedge clk)
begin
	if(rst==1'b1)
	begin
		Count=4'b0;
		Temp={(2*N+2){1'b0}};
		A_New={(2*N+2){1'b0}};
		B_New={(2*N+2){1'b0}};
		Y={(2*N+2){1'b0}};
		done=1'b0;
		
	end
	else
	begin
		if(start==1'b1)
		begin
		if(Count<4)
		begin
			if(Count==0)
			begin
				A_New={{(N+2){A0[N-1]^1'b0}},{A0}};
				B_New={{(N+2){B0[N-1]^1'b0}},{B0}};
			end
			if(Count==1)
			begin
				A_New={{(N+2){A1[N-1]^1'b0}},{A1}};
				B_New={{(N+2){B1[N-1]^1'b0}},{B1}};
			end
			if(Count==2)
			begin
				A_New={{(N+2){A2[N-1]^1'b0}},{A2}};
				B_New={{(N+2){B2[N-1]^1'b0}},{B2}};
			end
			if(Count==3)
			begin
				A_New={{(N+2){A3[N-1]^1'b0}},{A3}};
				B_New={{(N+2){B3[N-1]^1'b0}},{B3}};
			end
			Temp=Temp1[(2*N+1):0];
			Count=Count+1'b1;
		end
		else
		begin
			Count=Count;
			Y=Temp1[(2*N+1):0];
			done=1'b1;
		end
		end

	end
end

endmodule