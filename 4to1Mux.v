module mux4to1 (input a, 
				input b, 
				input c, 
				input d, 
				input X, Y,
				output out); 

  assign out = Y ? (X ? d : c) : (X ? b : a); 

endmodule