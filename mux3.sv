// 3:1 mux    
// CSE140L	  
module mux3 #(parameter WIDTH = 8)
  (input       [WIDTH-1:0] d0, d1, d2,
   input       [1:0]       s, 	// s[1] s[0]
   output logic[WIDTH-1:0] y);

// fill in guts
//  s[1]  s[0]  y
//  0     0    d0
//  0     1	   d1
//  1     0    d2
//  1     1	   d2


always_comb begin
	
	if( s[1] == 1) begin // whenever s[1] == 1 y = d2 (10,11)
		y = d2;
	end else if( s == 2'b00) begin // 2 bit answer = 00 y = d0;
		y = d0;
	end else begin
		y = d1; // 2'b01 
	end  

 end 
endmodule 