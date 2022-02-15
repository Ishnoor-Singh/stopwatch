`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:33:14 02/15/2022 
// Design Name: 
// Module Name:    final_display 
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
module final_display(
		input clk_sys,
		input clk_fast,
		input clk_blink,
		input adj, 
		input sel,
		input rst,
		input c_0,
		input c_1,
		input c_2,
		input c_3,
		output cathode,
		output anode
    );
	 // define anode and cathode
	 reg [6:0] cathode;
	 reg [3:0] anode;
	 
	 reg [3:0] one = 4'b1110;
	 reg [3:0] two = 4'b1101;
	 reg [3:0] three = 4'b1011;
	 reg [3:0] four = 4'b0111;
	 
	 reg c_blank = 7'b1111111;
	 
	 
	 always @(posedge clk_sys) begin
		if (rst) begin
			cathode <= 7'b1111110;
			anode <= 7'b1110;
		end
	 end
	 // at every clk fast, update if no adj or sel
	 always @(posedge clk_fast)  begin
		if (!adj) begin
			if (anode == one) begin
				cathode <= c_0;
				anode <= two;
			end
			else if (anode == two) begin
				cathode <= c_1;
				anode <= three;
			end
			else if (anode == three) begin
				cathode <= c_2;
				anode <= four;
			end
			else if (anode == four) begin
				cathode <= c_3;
				anode <= one;
			end
		end
		// to make things blink
		else begin
			if (anode == one) begin
				if (sel == 1) begin
					if (clk_blink == 1) begin
						cathode <= c_0;
					end 
					else begin
						cathode <= c_blank;
					end
				end
				else begin
					cathode <= c_0;
				end
				anode <= two;
			end
			else if (anode == two) begin
				if (sel == 1) begin
					if (clk_blink == 1) begin
						cathode <= c_1;
					end 
					else begin
						cathode <= c_blank;
					end
				end
				else begin
					cathode <= c_1;
				end
				anode <= three;
			end
			else if (anode == three) begin
				if (sel == 0) begin
					if (clk_blink == 1) begin
						cathode <= c_2;
					end 
					else begin
						cathode <= c_blank;
					end
				end
				else begin
					cathode <= c_2;
				end
				anode <= four;
			end
			else if (anode == four) begin
							if (sel == 0) begin
					if (clk_blink == 1) begin
						cathode <= c_3;
					end 
					else begin
						cathode <= c_blank;
					end
				end
				else begin
					cathode <= c_3;
				end
				cathode <= c_3;
				anode <= one;
			end
		end
	 end
	 
	 // 

endmodule
	