// Designing in Full Adder 
// Sum = a XOR b XOR cin, Cout = (a AND b) OR ( cin AND (a XOR b))


module Full_Adder(a, b, cin, Sum, Cout);

input a, b, cin; // a and b are inputs with size 1-bit
output Sum, Cout; // Sum and Cout are outputs with size 1-bit

wire S0, C1;
wire C2;
// Call Half Adder

Half_Adder HA1 (.a(a), .b(b), .Sum(S0), .Cout(C1));

Half_Adder HA2 (.a(cin), .b(S0), .Sum(Sum), .Cout(C2));

OR_2in R1 (.a(C1),.b(C2), .y(Cout));

endmodule
