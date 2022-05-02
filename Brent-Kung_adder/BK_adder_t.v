module	BK_adder_t;
  wire [16:0]s;
  reg [15:0]a,b;
	
  //instantiate device under test
  BK_adder	B1(a, b, s);
	
  //apply inputs one at a time
  initial	begin
    $dumpfile("mytest.vcd");
    $dumpvars;
    a=16'd46; b=16'd168;
    #100$display ("a = %d, b = %d;  sum = %d ", a,b,s); 
  end
  
  initial #200 $finish;
endmodule