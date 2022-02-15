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
		input clk, // 100 mhz
		output [6:0] cathode,
		output [3:0] anode
    );
	 
	 // Outputs
	wire clk_1Hz;
	wire clk_2Hz;
	wire clk_fast;
	wire clk_blink;

	// Instantiate the Unit Under Test (UUT)
	clk_div clks (
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
	time_counter cnt (
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
	
	wire min0;
	wire min1;
	wire sec0;
	wire sec1;
	
	get_digits digs (
		.minutes(minutes),
		.seconds(seconds),
		.min0(min0),
		.min1(min1),
		.sec0(sec0),
		.sec1(sec1)
	);
	
	wire m0;
	wire m1;
	wire s0;
	wire s1;
	
	get_cathode gc1 (
		.number(min0),
		.cathode(m0)
	);
	
	get_cathode gc2 (
		.number(min1),
		.cathode(m1)
	);
	
	get_cathode gc3 (
		.number(sec0),
		.cathode(s0)
	);
	
	get_cathode gc4 (
		.number(sec1),
		.cathode(s1)
	);
	
	final_display show(
		.clk_fast(clk_fast),
		.adj(adj), 
		.sel(sel),
		.c_0(s1),
		.c_1(s0),
		.c_2(m1),
		.c_3(m0),
		.cathode(cathode),
		.anode(anode)
	);
	
	

endmodule
