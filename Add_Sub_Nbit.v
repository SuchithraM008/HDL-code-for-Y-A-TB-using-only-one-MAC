// S = A + (-1)^k B  = A + k XOR B + k
// A and B are N-bits, k is single bit
//Output S is  N+1-bits
//---- Written by SaketRam, Suchithra and Surya ----

module Add_Sub_Nbit #(parameter N=4)(A,B, k, S);
//parameter N = 4;
input [N-1:0]A,B; // inputs are N-bits
input k; 
output [N:0]S; // output is N+1-bits 

wire [N+1:0]C; // N+1 bits 

wire [N:0] A1, B1;
wire [N:0]xB;


assign A1 = {A[N-1],A};
assign B1 = {B[N-1],B};

assign xB = k?~B1:B1; // k XOR B1


assign C[0] = k;

genvar i; 

generate 

for (i = 0; i < N+1; i= i+1) begin : FA //usedefined name 

Full_Adder FA_ (.a(A1[i]), .b(xB[i]), .cin(C[i]), .Sum(S[i]), .Cout(C[i+1])); // {Cout, Sum} = a + b + cin
end

endgenerate




endmodule
