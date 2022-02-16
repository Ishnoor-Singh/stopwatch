`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:13:58 01/08/2022 
// Design Name: 
// Module Name:    debouncer 
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
module debouncer(
	input clk,
	input btn,
	output state
    );
	 
	 reg bs = 0;	// button state
	 
	 reg [19:0] c;
	 
	 always @(posedge clk) begin
		// button not pressed
		if (btn == 0) begin
			bs <= 0;
			c <= 0;
		end else begin
			c <= c + 1'b1;
			if (c == 20'b11111111111111111111) begin
				bs <= 1;
				c <= 0;
			end
		end
	 end
	 
	 assign state = bs;


endmodule
