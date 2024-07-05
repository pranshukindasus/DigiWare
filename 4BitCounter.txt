module fourbc (input CLK,
               input reset,
               output reg[3:0] Z);
  
  always@(posedge CLK) begin
    if(reset)
      Z <= 0;
    else
      Z <= Z + 1;
  end
endmodule