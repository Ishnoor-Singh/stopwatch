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
		input [6:0] c_0,
		input [6:0] c_1,
		input [6:0] c_2,
		input [6:0] c_3,
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
	 
	 // at every clk fast, update if no adj or sel
	 always @(posedge clk_fast or posedge rst)  begin
		if (rst) begin
			cathode <= 7'b1111111;
			anode <= four;
		end
		else if (!adj) begin
			if (anode == one) begin
				cathode <= c_1;
				anode <= two;
			end
			else if (anode == two) begin
				cathode <= c_2;
				anode <= three;
			end
			else if (anode == three) begin
				cathode <= c_3;
				anode <= four;
			end
			else if (anode == four) begin
				cathode <= c_0;
				anode <= one;
			end
		end
		// to make things blink
		else begin
			if (anode == one) begin
				if (sel == 1) begin
					if (clk_blink == 1) begin
						cathode <= c_0;
						anode <= two;
					end 
					else begin
						cathode <= c_blank;
						anode <= two;
					end
				end
				else begin
					cathode <= c_0;
					anode <= two;
				end
			end
			else if (anode == two) begin
				if (sel == 1) begin
					if (clk_blink == 1) begin
						cathode <= c_1;
						anode <= three;
					end 
					else begin
						anode <= three;
						cathode <= c_blank;
					end
				end
				else begin
					cathode <= c_1;
					anode <= three;
				end
			end
			else if (anode == three) begin
				if (sel == 0) begin
					if (clk_blink == 1) begin
						cathode <= c_2;
						anode <= four;
					end 
					else begin
						cathode <= c_blank;
						anode <= four;
					end
				end
				else begin
					cathode <= c_2;
					anode <= four;
				end
			end
			else if (anode == four) begin
				if (sel == 0) begin
					if (clk_blink == 1) begin
						cathode <= c_3;
						anode <= one;
					end 
					else begin
						cathode <= c_blank;
						anode <= one;
					end
				end
				else begin
					cathode <= c_3;
					anode <= one;
				end
			end
		end
	 end
	 
	 // 

endmodule