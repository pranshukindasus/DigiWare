Design:


module jkff(J,K, CLK, Q);
  input J,K,CLK;
  output reg Q;
  
  always@(posedge CLK)
  begin
    if((!J)&&K)
      begin
        Q = 0;
      end
    if(J&&(!K))
      begin
        Q = J;
      end
    if(J&&K)
      begin
        Q = ~Q;
      end
    else
      begin
      end
  end
endmodule



-----------------

Testbench:

module testbench;
  reg J=0, K=0, CLK =0;
  wire Q;
  
  jkff UUT(J,K,CLK,Q);
  always begin
    CLK = ~CLK;
    #10;
  end
  
  initial begin
    $dumpfile("design.vcd");
    $dumpvars(0, testbench);
    J = 1; 
    K = 0; #20 //1,0
	K=1; #20   //1,1
    J=0;       
    K=1; #20   //0,1
    K=0; #20   //0,0
    
    $finish;
  end
endmodule