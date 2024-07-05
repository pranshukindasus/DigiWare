module TFF(T,CLK,R,Q);
  input T,CLK,R;
  output reg Q;
  always@(posedge CLK) begin
    if(!R)
      Q<=0;
    else
      if(T)
          Q<=~Q;
      else
        
          Q <= Q;
        
    end
endmodule