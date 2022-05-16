`timescale 10ns / 1ps
`define CYCLE 2
`define A_UPPER 65500
`define B_UPPER 256
`define INCRE 14
module	BK_adder_t;
  wire [16:0]s;
  reg [15:0]a,b;
  reg [16:0] result;
	integer num = 0;
  integer i, j;
  integer err = 0;
  //instantiate device under test
  BK_adder	B1(a, b, s);
	
  //apply inputs one at a time
  initial	begin
    $dumpfile("mytest.vcd");
    $dumpvars;
    a=16'd65535; b=16'd123;
    #`CYCLE 
    $display ("a = %d, b = %d;  sum = %d ", a,b,s); 

    for(i=0;i<`A_UPPER;i=i+`INCRE)
      for(j=0;j<`B_UPPER;j=j+`INCRE)
      begin
        #`CYCLE a = i[15:0]; b = j[15:0]; 
        
        #`CYCLE result = i[15:0] + j[15:0];
        if((result == s))begin
          $display("%d data is correct", num);
          $display ("a = %d, b = %d;  sum = %d ", a,b,s); 
        end
        else begin
          $display("data is error !!");
          $display ("a = %d, b = %d;  sum = %d ", a,b,s); 
          err = err + 1;
        end
        num = num + 1;
      end
  
  
  if(err == 0) begin
    $display("-------------------PASS-------------------");
    $display("\n");
    $display("        ****************************               ");
    $display("        **                        **       /|__/|  ");
    $display("        **  Congratulations !!    **      / O,O  | ");
    $display("        **                        **    /_____   | ");
    $display("        **  Simulation PASS!!     **   /^ ^ ^ \\  |");
    $display("        **                        **  |^ ^ ^ ^ |w| ");
    $display("        *************** ************   \\m___m__|_|");
    $display("\n");
  end else begin
    $display("-------------------ERROR-------------------");
    $display("There are %d errors!", err);
  end
    
  #10 $finish;
  end

endmodule