module fourbc (
  input CLK,
  input [1:0] ena,
  input [99:0] data,
  output reg [99:0] q
);
  integer i;

  always @* begin
    for (i = 0; i < 100; i = i + 1) begin
      q[i] = data[i];
    end
  end

  always @(posedge CLK) begin
    case (ena)
      2'b01: begin
        q[0] <= q[99];
        for (i = 1; i < 100; i = i + 1) begin
          q[i] <= q[i-1];
        end
      end
      2'b10: begin
        q[99] <= q[0];
        for (i = 0; i < 99; i = i + 1) begin
          q[i] <= q[i+1];
        end
      end
      2'b00, 2'b11: begin
        
      end
      default: begin
        
      end
    endcase
  end
endmodule