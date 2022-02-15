`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:34:37 02/10/2022
// Design Name:   time_counter
// Module Name:   C:/Xilinx/14.7/ISE_DS/ISE/Documents/Group1Lab6/lab3/testbench_timecounter.v
// Project Name:  lab3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: time_counter
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testbench_timecounter;

	// Inputs
	reg adj;
	reg sel;
	reg pause;
	reg rst;
	reg clk_1Hz;
	reg clk_2Hz;

	// Outputs
	wire [5:0] minutes;
	wire [5:0] seconds;

	// Instantiate the Unit Under Test (UUT)
	time_counter uut (
		.adj(adj), 
		.sel(sel), 
		.pause(pause), 
		.rst(rst), 
		.clk_1Hz(clk_1Hz), 
		.clk_2Hz(clk_2Hz),  
		.minutes(minutes), 
		.seconds(seconds)
	);

	initial begin
		// Initialize Inputs
		adj = 0;
		sel = 0;
		pause = 0;
		rst = 0;
		clk_1Hz = 0;
		clk_2Hz = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		
		// Initialize Inputs
		rst = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
		rst = 1;
		
		#1000;
		
		rst = 0;
		
		#100;
		
		#5000;
		pause = 1;
		#500;
		pause = 0;
		adj = 1;
		#200;
		#5000;
		pause = 1;
		#500;
		sel = 1;
		pause = 0;
		#200;
		
        
		// Add stimulus here

	end
	
	always #5 clk_1Hz = ~clk_1Hz;
	always #2.5 clk_2Hz = ~clk_2Hz;
;

      
endmodule

