// N-bit Adder/Subtractor (active low subtract)
// CSE140L     lab 1
// combinational logic
module addsub #(parameter dw=8)
(
  input        [dw-1:0] dataa,
  input        [dw-1:0] datab,
  input                 add_sub,	  // if this is 1, add; else subtract
  output logic [dw-1:0] result
);

// fill in guts        
//add_sub       result
//1             dataa + datab;						
//0             dataa - datab;   

always_comb  begin//whenever any data is changed, addition or subtraction will take place
   case(add_sub)
   0:result = dataa - datab;
   1:result = dataa + datab;
   endcase
end
endmodule
