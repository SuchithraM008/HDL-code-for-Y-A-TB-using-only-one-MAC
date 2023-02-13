module MUL_Sign #(parameter M=4,N=4)(A,B,sg,Y);
    input [N-1:0]A;
    input [M-1:0]B;
    input sg;
    output [M+N-1:0]Y;
    
   
    // Declare partial products terms, Total partial products are M
	wire [N-1:0]P[0:M-1]; // Bits-size of each partial product is N-bits
	wire [N-1:0]S[0:M-1]; // 

// Generate partial products 


generate
genvar i;
    for(i=0;i<M-1;i=i+1)
    begin:partial_products_gen
    	assign P[i] = B[i] ? {sg^A[N-1],A[N-2:0]}:{sg,{(N-1){1'B0}}};
    end
endgenerate
assign P[M-1] = B[M-1]?{A[N-1],sg?~(A[N-2:0]):A[N-2:0]}:{1'B0,{(N-1){sg}}};

// Add partial products 
    assign {S[0], Y[0]} = {sg, P[0]}; 



generate 
genvar j; 
	for(j = 0; j < M-1; j = j + 1)
	begin: Add_partial_products
		assign {S[j+1], Y[j+1]} = P[j+1] + S[j]; 
	end
endgenerate



wire t; //used store the MSB bit of the result

wire [N+M-1:M]Q; //To store the intermediate result

assign Q[N+M-1:M] = S[M-1];
assign t = sg^Q[N+M-1]; // xor operation of MSB and sign selection bit
assign Y[N+M-1:M] = {t,Q[N+M-2:M]};

endmodule