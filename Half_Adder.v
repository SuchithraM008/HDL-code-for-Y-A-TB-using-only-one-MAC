// Designing in Half Adder 
// Sum = a XOR b, Cout = a AND b


module Half_Adder(a, b, Sum, Cout);

input a, b; // a and b are inputs with size 1-bit
output Sum, Cout; // Sum and Cout are outputs with size 1-bit

assign Sum = a ^ b; 
assign Cout = a & b; 

endmodule
