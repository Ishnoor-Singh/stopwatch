`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    07:07:22 01/08/2022 
// Design Name: 
// Module Name:    get_cathode 
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
module get_cathode(
	input [3:0] number,
	output [6:0] cathode
    );
	 
	 reg [6:0] c;
	 
	 always @(*) begin
		if (number == 0) begin
			c <= 7'b0000001;
		end else if (number == 1) begin
			c <= 7'b0000110;
		end else if (number == 2) begin
			c <= 7'b0100100;
		end else if (number == 3) begin
			c <= 7'b0110000;
		end else if (number == 4) begin
			c <= 7'b0011001;
		end else if (number == 5) begin
			c <= 7'b0010010;
		end else if (number == 6) begin
			c <= 7'b0000010;
		end else if (number == 7) begin
			c <= 7'b1111000;
		end else if (number == 8) begin
			c <= 7'b0000000;
		end else if (number == 9) begin
			c <= 7'b0010000;
		end
		
	 end
	 
	 assign cathode = c;


endmodule