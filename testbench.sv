module testbench;
 // Inputs
 
 reg [8-1:0] dataa;
 reg [8-1:0] datab;
 // Outputs
 reg [8-1:0] result;
 reg add_sub;

 // Instantiate the Unit Under Test (UUT)
 addsub #(8) uut (
  .dataa(dataa), 
  .datab(datab), 
  .add_sub(add_sub),
  .result(result)
 );

 initial begin

  //add_sub currently set to add/sub anytime add_sub, dataa, or datab is changed. Need to fix

  #5 add_sub = 0; dataa = 9; datab = 2; add_sub = 0;
  $monitor("%d - %d = %d",dataa,datab,result);

  #10 dataa = 3; datab = 2; add_sub = 1;
  $monitor("%d + %d = %d",dataa,datab,result);

  #15 dataa = 4; datab = 4; add_sub = 0;
  $monitor("%d - %d = %d",dataa,datab,result);

  #20 dataa = 10; datab = 2; add_sub = 1;
  $monitor("%d + %d = %d",dataa,datab,result);

  #25 add_sub=0;
  $monitor("%d - %d = %d",dataa,datab,result);

  #30 dataa = 0;
  $monitor("%d - %d = %d",dataa,datab,result);

  #35 add_sub=1;
  $monitor("%d + %d = %d",dataa,datab,result);

  #40 dataa = 9; datab = 10; add_sub = 0;
  $monitor("%d - %d = %d",dataa,datab,result);
   
 end

		
endmodule 