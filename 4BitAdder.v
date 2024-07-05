module FBA( input[3:0]A,
           input [3:0]B,
           input c_in,
           output c_out,
           output [3:0]S);
    
  assign {c_out,S} = A + B + c_in;
endmodule