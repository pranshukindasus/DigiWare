module calc_tb;

  // Inputs
  reg en;
  reg [3:0] in1;
  reg [3:0] in2;
  reg [1:0] ops;

  // Outputs
  wire [7:0] total;

  // Instantiatiation of the calc module
  calc uut (
    .en(en),
    .in1(in1),
    .in2(in2),
    .ops(ops),
    .total(total)
  );

  // Dumping the file
  initial begin
    $dumpfile("calc_tb.vcd");
    $dumpvars(0, calc_tb);
  end

  
  initial begin
    // Test Case 1: Addition
    en = 1;
    in1 = 5;
    in2 = 7;
    ops = 2'b00;
    #10;
    
    // Test Case 2: Subtraction
    in1 = 8;
    in2 = 3;
    ops = 2'b01;
    #10;

    // Test Case 3: Multiplication
    in1 = 4;
    in2 = 6;
    ops = 2'b10;
    #10;

    // Test Case 4: Division
    in1 = 12;
    in2 = 3;
    ops = 2'b11;
    #10;

    $finish;
  end

endmodule