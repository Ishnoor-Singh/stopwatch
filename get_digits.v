`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    06:38:13 01/08/2022 
// Design Name: 
// Module Name:    get_digits 
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
module get_digits(
		input [6:0] minutes,
		input [5:0] seconds,
		output [3:0] min0,
		output [3:0] min1,
		output [3:0] sec0,
		output [3:0] sec1
    );
	 
	 reg [3:0] m0;
	 reg [3:0] m1;
	 reg [3:0] s0;
	 reg [3:0] s1;

	always @(*) begin
		m0 <= minutes % 4'd10;
		m1 <= (minutes - minutes % 4'd10)/10;
		s0 <= seconds % 4'd10;
		s1 <= (seconds - seconds % 4'd10)/10;
	end
	
	assign min0 = m0;
	assign min1 = m1;
	assign sec0 = s0;
	assign sec1 = s1;

endmodule
