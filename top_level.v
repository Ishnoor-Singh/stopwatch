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
	 wire rstState;
	 
	// Instantiate the Unit Under Test (UUT)
	debouncer rst_dbncr(
		.clk(clk),
		.btn(rst),
		.state(rstState)
	);
	
	// Outputs
	 wire pauseState;
	 
	// Instantiate the Unit Under Test (UUT)
	debouncer pause_dbncr(
		.clk(clk),
		.btn(pause),
		.state(pauseState)
	);
	 
	 // Outputs
	wire clk_1Hz;
	wire clk_2Hz;
	wire clk_fast;
	wire clk_blink;

	// Instantiate the Unit Under Test (UUT)
	clk_div clks (
		.clk_in(clk),
		.rst(rstState), 
		.clk_1Hz(clk_1Hz), 
		.clk_2Hz(clk_2Hz), 
		.clk_fast(clk_fast), 
		.clk_blink(clk_blink)
	);
	
	// Outputs
	wire [5:0] minutes;
	wire [5:0] seconds;

	// Instantiate the Unit Under Test (UUT)
	time_counter cnt (
		.adj(adj),
		.sel(sel),
		.pause(pauseState),
		.rst(rstState),
		.clk_1Hz(clk_1Hz),
		.clk_2Hz(clk_2Hz),
		.minutes(minutes),
		.seconds(seconds)
	);
	
	wire [3:0] min0;
	wire [3:0] min1;
	wire [3:0] sec0;
	wire [3:0] sec1;
	
	get_digits digs (
		.minutes(minutes),
		.seconds(seconds),
		.min0(min0),
		.min1(min1),
		.sec0(sec0),
		.sec1(sec1)
	);
	
	wire [6:0] m0;
	wire [6:0] m1;
	wire [6:0] s0;
	wire [6:0] s1;
	
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
		.clk_blink(clk_blink),
		.clk_fast(clk_fast),
		.adj(adj), 
		.sel(sel),
		.rst(rstState),
		.c_0(s0),
		.c_1(s1),
		.c_2(m0),
		.c_3(m1),
		.cathode(cathode),
		.anode(anode)
	);
	
	

endmodule