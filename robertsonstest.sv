// CSE140L     Lab 1
// top level test bench -- simulation only
// multiplicand inputs are valid from -64 to +127 only
//   We shall therefore restrict testing to 7-bit inputs (-64 to +63)
module robertsonstest;

// DUT Inputs
  bit               clk;                 // 1-bit, 0 or 1 only (no x or z)
  bit               reset;               // self-initializes to 0
  byte              multiplier;          // 8-bit signed, no x or z bits
  byte              multiplicand;

// DUT Outputs
  wire signed[15:0] product;
  wire              done;                // tells test bench to read product
    
// count number of clock cycles
  int               cycle,
// count number of individual trials
                    cycle1,
// count number of massed trials  
                    cycle2;  

// expected results
  logic signed[15:0] expected_product;

// Instantiate the Unit Under Test (UUT)
  toprobertsons uut (
  	.clk          (clk), 
  	.reset        (reset), 
  	.multiplier   (multiplier), 
  	.multiplicand (multiplicand), 
  	.product      (product),
  	.done         (done)
	);
        
  initial begin
// starts automatically with 0*0
    rslt_disp;
// Add stimulus here
// start w/ Positive Multiplicand, Positive Multiplier
    multiplier   = 5;
    multiplicand = 6;
    rslt_disp;
// Negative Multiplicand, Positive Multiplier    
    multiplier   =  7;
    multiplicand = -5;
    rslt_disp;
// Positive Multiplicand, Negative Multiplier
    multiplier   = -5;
    multiplicand =  6;
    rslt_disp;
// Positive Multiplicand, Negative Multiplier
    multiplier   = -7;
    multiplicand =  8;
    rslt_disp;
// Negative Multiplicand, Negative Multiplier
    multiplier   = -5;
    multiplicand = -6;
    rslt_disp;
// Negative Multiplicand, Negative Multiplier
    multiplier   = -9;
    multiplicand = -4;
    rslt_disp;
// now try a comprehensive test -- nested FOR loops
    for(multiplier = -64; multiplier<64; multiplier++) begin
	  for(multiplicand = -64; multiplicand<64; multiplicand++) 
        rslt_disp2;
    end
    #40ns $display("clock cycles = %d, test cycles = %d, sequence_cycles = %d",cycle,cycle1,cycle2);
    $stop;
  end
      
// generate digital clock to drive sequential logic in DUT
  always begin
	#5ns  clk = 1'b1;       // tic 
	#5ns  clk = 1'b0;       // toc
    cycle++;
  end

// generate display list for transcript, individual tests
  task rslt_disp;
    reset = 1;                  // requeset next multiplication from DUT
    #10ns reset = 0;
	cycle1++;
    expected_product = multiplier * multiplicand;
 	#10ns wait(done);           // wait for acknowledge from DUT
    if (product == expected_product) begin
// in hex (0x) format     
      $display("Simulation succeeded %h = %h = %h * %h", expected_product,product,multiplier,multiplicand);
// also in decimal
      $display("Simulation succeeded %d = %d = %d * %d", expected_product,product,multiplier,multiplicand);
    end
    else 
      $display("Simulation failed %h != %h = %h * %h", product,expected_product,multiplier,multiplicand);
	#40ns;
  endtask

// for comprehensive test, print only the failures
  task rslt_disp2;
    reset = 1; 
    #10ns reset = 0;
    expected_product = multiplier * multiplicand;
	cycle2++;
 	#10ns wait(done);
    if (product != expected_product) 
      $display("Simulation failed %h != %h = %h * %h", product,expected_product,multiplier,multiplicand);
	#40ns;
  endtask
         
endmodule


