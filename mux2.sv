// 2:1 mux (selector) of N-wide buses
// CSE140L
module mux2 #(parameter WIDTH = 8)
 (input        [WIDTH-1:0] d0, d1, 
  input                    s, 
  output logic [WIDTH-1:0] y);
  
// fill in guts
// always_comb if(...) y = ...;
// s   y
// 0   d0	y[7:0] = d0[7:0]
// 1   d1	y[7:0] = d1[7:0]

always_comb begin
	
	// logic of output: y = s'd0 + sd1
	
	
	// 1'b0 = 1 bit answer and s = 0
	if( s == 1'b0) begin
		y = d0;
	end else begin
		y = d1;
	end  
end
endmodule


