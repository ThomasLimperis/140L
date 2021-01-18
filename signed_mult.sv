// Behavioral signed multiplication. Used to test the testbench.
module signed_mult (
  output logic signed[15:0]	out,
  input			            clk,
  input        signed[ 7:0] a,
  input        signed[ 7:0] b);

  logic	signed [ 7:0] 	a_reg;
  logic	signed [ 7:0] 	b_reg;

  wire 	signed [15:0]	mult_out;

  assign mult_out = a_reg * b_reg;

  always @(posedge clk) begin			// note nonblocking assignments: all happen in parallel
		a_reg <= a;						// register input operands
		b_reg <= b;
		out   <= mult_out;				// register output
  end

endmodule
