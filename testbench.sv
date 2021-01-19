module testbench;
 // Inputs
 
 reg [8-1:0] dataa;
 reg [8-1:0] datab;
 // Outputs
 reg [8-1:0] result;
 reg add_sub;
 
logic d0,d1,s;
wire y; 



 // Instantiate the Unit Under Test (UUT)
 addsub #(8) uut (
  .dataa(dataa), 
  .datab(datab), 
  .add_sub(add_sub),
  .result(result)
 );
mux2 #(8) utt(
	.d0(d0),
	.d1(d1),
	.s(s),
	.y(y)
);

logic [7:0] r;
reg clk, reset, ena;
counter_down #(8) utt1(
	.clk(clk),
	.reset(reset),
	.ena(ena),
	.result(r)

);


//addsub
initial begin
  //add_sub currently set to add/sub anytime add_sub, dataa, or datab is changed. Need to fix

  $monitor("addsub--------------");
  #5 add_sub = 0; dataa = 9; datab = 2; add_sub = 0;
  $monitor("%d - %d = %d",dataa,datab,result);

$monitor("mux2--------------");
for(int i = 0; i < 8; i++) begin
		d0 = i[0];
		d1 = i[1];
		s  = i[2];
		#1 $display(d0,,d1,,s,,,,y);
	end
r = 10;

$monitor("counter_down--------------");
for(int i = 0; i < 32; i++) begin
		clk = i[0];
		ena  = i[1];
                reset = i[2];
		#1 $monitor("%d %d %d %d",clk, reset, ena,r);
	end


end








		
endmodule 