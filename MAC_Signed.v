module MAC_Signed #(parameter N = 8)(A,B,C,Y);
input [N-1:0]A;
input [N-1:0]B;
input [N-1:0]C;
output [2*N:0]Y;

wire [2*N-1:0]BC;

MUL_Sign #( .M(N),.N(N) )MUL_1(.A(B),.B(C),.sg(1'b1),.Y(BC));

reg [2*N-1:0] A_New;

assign A_New={{N{A[N-1]^1'b0}},{A}};
Add_Sub_Nbit #(.N(2*N)) Adder_1(.A(A_New),.B(BC),.k(1'b0),.S(Y));
endmodule