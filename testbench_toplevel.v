`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   14:47:55 02/10/2022
// Design Name:   top_level
// Module Name:   C:/Xilinx/14.7/ISE_DS/ISE/Documents/Group1Lab6/lab3/testbench_toplevel.v
// Project Name:  lab3
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: top_level
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module testbench_toplevel;

	// Inputs
	reg adj;
	reg sel;
	reg pause;
	reg rst;
	reg clk;

	// Instantiate the Unit Under Test (UUT)
	top_level uut (
		.adj(adj), 
		.sel(sel), 
		.pause(pause), 
		.rst(rst), 
		.clk(clk)
	);

	initial begin
		// Initialize Inputs
		adj = 0;
		sel = 0;
		pause = 0;
		rst = 0;
		clk = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here

	end
      
endmodule

