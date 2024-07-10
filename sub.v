module sub (in1,in2,out);
input [3:0] in1;
input [3:0] in2;
output reg[7:0] out;
always @*begin
    if(in2>in1)
        out=in2-in1;
    else 
        out=in1-in2;
end
    
endmodule