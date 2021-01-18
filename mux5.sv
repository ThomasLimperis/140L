// 5:1 MULTIPLEXER	(combinational)
module mux5 (input        d0, d1, d2, d3, d4,
             input [2:0]  s, 
             output logic y);

always_comb begin   // always @(*)    // always @(d0, d1, d2, d3, d4, s);
// fill in guts
// when using always_comb, be sure to cover all cases
// case(s)
//     0: y = ...;
//	 ...
//	 default: y = ...;  // shorthand for last N cases with same output
// endcase
//  s      y
//  0	  d0		s = 3'b000
//  1	  d1
//  2	  d2
//  3	  d3
//  4	  d4
//  5	   0
//  6	   0
//  7	   0	    s = 3'b111

if(s == 0) begin
	y = d0;
end else if (s == 1) begin
	y = d1;
end else if (s == 2) begin
	y = d2;
end else if (s == 3) begin
	y = d3;
end else if (s == 4) begin
	y = d4;
end else
	y = 0;


end
endmodule
