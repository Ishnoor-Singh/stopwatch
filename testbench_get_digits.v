`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   06:49:16 01/08/2022
// Design Name:   get_digits
// Module Name:   /home/ise/lab3/testbench_get_digits.v
// Project Name:  lab3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: get_digits
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testbench_get_digits;

	// Inputs
	reg [6:0] minutes;
	reg [5:0] seconds;

	// Outputs
	wire [3:0] min0;
	wire [3:0] min1;
	wire [3:0] sec0;
	wire [3:0] sec1;

	// Instantiate the Unit Under Test (UUT)
	get_digits uut (
		.minutes(minutes), 
		.seconds(seconds), 
		.min0(min0), 
		.min1(min1), 
		.sec0(sec0), 
		.sec1(sec1)
	);

	initial begin
		// Initialize Inputs
		minutes = 57;
		seconds = 7;

		// Wait 100 ns for global reset to finish
		#1000;
      
		minutes = 99;
		seconds = 59;
		
		#1000;
      
		minutes = 1;
		seconds = 0;
		
		#1000;
      
		minutes = 0;
		seconds = 0;

		// Add stimulus here

	end
      
endmodule

