`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   21:44:28 05/14/2023
// Design Name:   round_robin
// Module Name:   /home/ise/xlinix_files/xyz/round_robin_tb.v
// Project Name:  xyz
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: round_robin
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module round_robin_tb;

	// Inputs
	reg             clk;    
reg             rst;    
reg             req3;   
reg             req2;   
reg             req1;   
reg             req0;   
wire            gnt3;   
wire            gnt2;   
wire            gnt1;   
wire            gnt0;  

// Clock generator
always #1 clk = ~clk;

initial begin
  $dumpfile ("arbiter.vcd");
  $dumpvars();
  clk = 0;
  rst = 1;
  req0 = 0;
  req1 = 0;
  req2 = 0;
  req3 = 0;
  #10 rst = 0;
  repeat (1) @ (posedge clk);
  req0 <= 1;
  repeat (1) @ (posedge clk);
  req0 <= 0;
  repeat (1) @ (posedge clk);
  req0 <= 1;
  req1 <= 1;
  repeat (1) @ (posedge clk);
  req2 <= 1;
  req1 <= 0;
  repeat (1) @ (posedge clk);
  req3 <= 1;
  req2 <= 0;
  repeat (1) @ (posedge clk);
  req3 <= 0;
  repeat (1) @ (posedge clk);
  req0 <= 0;
  repeat (1) @ (posedge clk)
  #10 $finish;
end 

// Connect the DUT
arbiter U (
 clk,    
 rst,    
 req3,   
 req2,   
 req1,   
 req0,   
 gnt3,   
 gnt2,   
 gnt1,   
 gnt0   
);
      
endmodule

