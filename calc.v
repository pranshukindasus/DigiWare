`include "add.v"
`include "multiply.v"
`include "div.v"
`include "sub.v"
module calc (in1, in2, total, ops,en);
input en;
input [3:0] in1;
input [3:0] in2;
input [1:0] ops;
wire [7:0] add_out, sub_out, mul_out, div_out;
output reg[7:0] total;
reg state;
reg [3:0] add_inp1,add_inp2, sub_inp1, sub_inp2, mul_inp1, mul_inp2, div_inp1, div_inp2;
add adder(.in1(add_inp1),.in2(add_inp2),.out(add_out));
sub subtract(.in1(sub_inp1),.in2(sub_inp2),.out(sub_out));
multiply mult(.in1(mul_inp1),.in2(mul_inp2),.out(mul_out));
div divide(.in1(div_inp1),.in2(div_inp2),.out(div_out));
initial
    total=0;
always @* begin
    if(en) begin
        state=1;
        case (ops)
            2'b00:begin 
                add_inp1 = in1;
                add_inp2 = in2;
                total=add_out;
            end 
            2'b01:begin 
                sub_inp1 = in1;
                sub_inp2 = in2;
                total=sub_out;
            end 
            2'b10:begin 
                mul_inp1 = in1;
                mul_inp2 = in2;
                total=mul_out;
            end
            2'b11:begin 
                div_inp1 = in1;
                div_inp2 = in2;
                total=div_out;
            end 
            default: 
                state=0;
        endcase
    end
end
always @(state) begin
    if(!state) begin
        total=0;
        $display("Something is incorrect");
    end  
end
endmodule