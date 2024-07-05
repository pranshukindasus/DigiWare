module FSM(input x,
           input CLK,
           input reset,
           output reg z);
  reg state;
  always@(posedge CLK or posedge reset)
    if(reset) state <= 1;
    else state <= state;
  
  always@(state,x)
    case(state)
      1:begin
        z = x?1:0;
        state = z;
      end
      0:begin
        z = x?0:1;
        state = z;
      end
      default: state = 1;
    endcase
endmodule
