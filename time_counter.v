`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:04:30 02/10/2022 
// Design Name: 
// Module Name:    time_counter 
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
module time_counter(
		input adj,
		input sel,
		input pause,
		input rst,
		input clk_1Hz,
		input clk_2Hz,
		output [6:0] minutes,
		output [5:0] seconds
    );
	 
	 reg [6:0] mc;
	 reg [5:0] sc;
	 reg isPaused;
	 
	 reg clock;
	 always @(*) begin
		 if (adj) begin
			clock <= clk_2Hz;
		 end else begin
			clock <= clk_1Hz;
		 end
	 end	 
	 
	 always @(posedge pause or negedge pause) begin
		isPaused <= ~isPaused;
	 end

	 always @(posedge clock or posedge rst) begin
		if(rst) begin
			mc <= 7'd0;
			sc <= 6'd00;
			isPaused <= 1'd0;
		end else if(~isPaused && ~adj) begin
			if(sc == 6'd59) begin
				if(mc == 7'd99) begin
					mc <= 7'd0;
				end else begin
					mc <= mc + 1;
				end
				sc <= 6'd0;
			end else begin
				sc <= sc + 1;
			end
		end else if(~isPaused && adj && ~sel) begin
			if(mc == 7'd99) begin
				mc <= 7'd0;
			end else begin
				mc <= mc + 1;
			end
		end else if(~isPaused && adj && sel) begin
			if(sc == 6'd59) begin
				sc <= 6'd0;
			end else begin
				sc <= sc + 1;
			end
		end
	 end
	 
	 assign minutes = mc;
	 assign seconds = sc;
	 
 endmodule

