module mux2_tb();
logic d0,d1,s;
wire y; 

mux2 #(8) utt(
	.d0(d0),
	.d1(d1),
	.s(s),
	.y(y)
);

initial begin
	for(int i = 0; i < 8; i++) begin
		d0 = i[0];
		d1 = i[1];
		s  = i[2];
		#1 $display(d0,,d1,,s,,,,y);
	end
	$stop;
	  
end

endmodule 