// Writing HDL code for 2-input OR gate with inputs size 1-bit
// y = a OR b
// Written by Vikram

module OR_2in(a,b, y);

input a, b;
output y; 

assign y = a | b; // a | b; 

endmodule 