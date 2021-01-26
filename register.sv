// load and store register
// sequential NOT combinational
module register # (parameter N = 8)
   (input                clk,   // implied input wire
    input                load,
    input                clear,
    input        [N-1:0] in,
    output logic [N-1:0] out
    );
	 
  always_ff @ (posedge clk, posedge clear)    begin
// fill in guts
//  if(...) out <= ... ;
//  else if(...) out <= ... ;
//   clear   load    out
//     1       0      0	   (clear output)
//     1       1      0
//     0       0     hold  (no change in output)
//     0       1      in   (update output)

	if (clear) begin
		out<= 0;
	end else if (load ==1) begin
		out<= in;
	end else begin
		out <= out;
	end

//If clear was not in the sensitivity list, then if clk was low and clear was high, it would never clear.
//Must change out depending on when clk or clear is high.
	

	
// Aside: What would be the impact of leaving posedge clear out of 
//  the sensitivity list? 
end	
		
endmodule

