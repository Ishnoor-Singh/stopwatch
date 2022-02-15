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
	 
	 
	 always @(posedge clk) begin
		if (rst) begin
			cathode <= 7'b1111110;
			anode <= 7'b1110;
		end
	 end
	 // at every clk fast, update if no adj or sel
	 always @(posedge clk_fast)  begin
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
			cathode <= c_4;
			anode <= one;
		end
	 end
// 

endmodule
	