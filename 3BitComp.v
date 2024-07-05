module comp(
  input [2:0] A, B,
  output reg AGreater, ALesser, Equal);
  
  always@(A or B) begin
    AGreater = 0; ALesser = 0; Equal = 0;
    if(A>B) AGreater = 1'b1;
    else if(A<B) ALesser = 1'b1;
    else Equal = 1'b1;
  end
endmodule