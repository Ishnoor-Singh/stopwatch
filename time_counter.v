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
		input clk_in,
		output minutes,
		output seconds
    );
	 
	 wire [5:0] minutes;
	 wire [5:0] seconds;

	 
	 wire min_clk;
	 // count_to60 min clk!hz clk2Hz sysclk (adj & sel) min 
	 clk_div_60 clk_div(.clk_sys(clk_in), .clk_in(clk_1Hz), .rst(rst), .min_clk(min_clk));
	 count_to_60 sec(.clk(clk_1Hz), .clk_2Hz(clk_2Hz), .clk_sys(clk_in), .adj_this_clk(adj & sel), .rst(rst), .pause(pause), .count(seconds));
	 count_to_60 min(.clk(min_clk), .clk_2Hz(clk_2Hz), .clk_sys(clk_in), .adj_this_clk(adj & ~sel), .rst(rst), .pause(pause), .count(minutes));
	 // clk_div_60 (clk_sys, clk!Hz, clkMin)
	 // count_to60 
	 
	 
 endmodule


module count_to_60(
	input clk, // could be min or sec
	input clk_2Hz, // for adj mode
	input clk_sys, // for rst
	input adj_this_clk,
	input rst,
	input pause,
	output count
	);
	reg [5:0] count;

	
	always @(posedge clk_sys) begin
		if (rst) begin
			count = 6'd0;
		end
	 end
	 
	 always @(negedge clk) begin
		if (adj_this_clk != 1 & !pause) begin
			if (count == 6'd59) begin
				count = 6'd0;
			end
			else begin
				count <= count + 1'b1;
			end
		end
	 end
	 
	 always @(negedge clk_2Hz) begin
		if (adj_this_clk == 1 & !pause) begin
			if (count == 6'd59) begin
				count = 6'd0;
			end
			else begin
				count <= count + 1'b1;
			end
		end
	 end
endmodule

module clk_div_60(
	input clk_sys,
	input clk_in,
	input rst,
	output min_clk
	);
	
	reg min_clk;
	
	reg [5:0] counter;
	reg clk_pulse;
	
	always @(posedge clk_sys) begin 
		if (rst)
			begin
				counter <= 6'd0;
				clk_pulse <= 0;
				min_clk <= 0;
			end
	end
	
	always @(negedge clk_in) begin
		if (counter == 6'b011101) begin
			min_clk <= ~min_clk;
			counter <= 6'd0;
		end else begin
			counter <= counter + 1'b1;
		end
	end

//	
//	always @(posedge clk_in) begin
//		if (counter == 6'd0) begin
//			min_clk <= 1;
//			counter <= counter + 1'b1;
//		end else if (counter == 6'd29) begin
//			min_clk <= 0;
//			counter <= counter + 1'b1;
//		end  else if (counter == 6'd59) begin
//			min_clk <= 1;
//			counter <= 6'd0;
//		end
//		else begin
//			counter <= counter + 1'b1;
//		end
//	end
//
	
//	always @(posedge clk_sys) begin
//		if (rst)
//				begin
//					counter <= 6'd0;
//					clk_pulse <= 0;
//					min_clk <= 0;
//				end
//	end
//	
//	always @ (posedge clk_in)
//		begin
//			if (counter == 6'd0)
//				begin
//					counter <= counter + 1'b1;
//					clk_pulse <= 0;
//				end
//			else if (counter == 6'd1)
//				begin
//					counter <= counter + 1'b1;
//					clk_pulse <= 1;
//				end
//			else if (counter == 6'd2)
//				begin
//					counter <= counter + 1'b1;
//					clk_pulse <= 0;
//				end
//
//			else if (counter == 6'd29)
//				begin
//					counter <= 6'd0;
//					clk_pulse <= 0;
//				end
//			else
//				begin
//					counter <= counter  + 1'b1;
//				end
//		end
//		
//		always @(posedge clk_in)
//			begin
//				if (clk_pulse == 1)
//					begin
//						min_clk <= ~min_clk;
//					end
//			end
endmodule