`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:43:55 02/08/2022 
// Design Name: 
// Module Name:    top_level 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module top_level(
		input adj,
		input sel,
		input pause,
		input rst,
		input clk // 100 mhz
    );
	 
	 // Outputs
	wire clk_1Hz;
	wire clk_2Hz;
	wire clk_fast;
	wire clk_blink;

	// Instantiate the Unit Under Test (UUT)
	clk_div uut (
		.clk_in(clk),
		.rst(rst), 
		.clk_1Hz(clk_1Hz), 
		.clk_2Hz(clk_2Hz), 
		.clk_fast(clk_fast), 
		.clk_blink(clk_blink)
	);
	
	// Outputs
	wire minutes;
	wire seconds;

	// Instantiate the Unit Under Test (UUT)
	time_counter uut (
		.adj(adj), 
		.sel(sel), 
		.pause(pause), 
		.rst(rst), 
		.clk_1Hz(clk_1Hz), 
		.clk_2Hz(clk_2Hz), 
		.clk_in(clk), 
		.minutes(minutes), 
		.seconds(seconds)
	);

endmodule
