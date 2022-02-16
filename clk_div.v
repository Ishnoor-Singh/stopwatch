`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    14:45:05 02/08/2022 
// Design Name: 
// Module Name:    clk_div 
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
module clk_div(
	input clk_in,
	input rst,
	output clk_1Hz,
	output clk_2Hz,
	output clk_fast,
	output clk_blink
    );
	 
	 clk_fast fast(.clk_in(clk_in), .rst(rst), .clk_out(clk_fast));
	 div_100 blink(.clk_in(clk_fast), .clk_sys(clk_in), .rst(rst), .clk_out(clk_blink));
	 div_2 get_2(.clk_in(clk_blink), .clk_sys(clk_in), .rst(rst), .clk_out(clk_2Hz));
	 div_2 get_1(.clk_in(clk_2Hz), .clk_sys(clk_in), .rst(rst), .clk_out(clk_1Hz));

// 400 hz -> 4Hz
// 100 Mhz -> 400hz

endmodule

module div_2(
	input clk_in,
	input clk_sys,
	input rst,
	output clk_out
	);
	
	reg clk_out;
	
	always @(posedge clk_in or posedge rst) begin
		if (rst)
		begin
			clk_out <= 1'b0;

		end
		else begin
			clk_out <= clk_out + 1;
		end
	end

endmodule

module div_100(
	input clk_in,
	input clk_sys,
	input rst,
	output clk_out
	);
	
	reg clk_out = 0;
	
	reg [5:0] counter;
	reg clk_pulse;
	
	always @ (posedge clk_in or posedge rst)
		begin
		if (rst)
				begin
					counter <= 6'd0;
					clk_pulse <= 0;
				end
			else if (counter == 6'd48)
				begin
					counter <= counter + 1'b1;
					clk_pulse <= 1;
				end
			else if (counter == 17'd49)
				begin
					counter <= 6'd0;
					clk_pulse <= 0;
				end
			else
				begin
					counter <= counter  + 1'b1;
				end
		end
		
		always @(posedge clk_in)
			begin
				if (clk_pulse == 1)
					begin
						clk_out <= ~clk_out;
					end
			end
	
endmodule

module clk_fast(
	input clk_in,
	input rst,
	output clk_out
	);
	reg clk_out;
	
	reg [16:0] counter;
	reg clk_pulse;
	
	always @ (posedge clk_in)
		begin
			if (rst)
				begin
					counter <= 17'd0;
					clk_pulse <= 0;
				end
			else if (counter == 17'd124998)
				begin
					counter <= counter + 1'b1;
					clk_pulse <= 1;
				end
			else if (counter == 17'd124999)
				begin
					counter <= 17'd0;
					clk_pulse <= 0;
				end
			else
				begin
					counter <= counter  + 1'b1;
				end
		end
		
		always @(posedge clk_in)
			begin
				if (rst)
					begin
						clk_out <= 0;
					end 
				else if (clk_pulse == 1)
					begin
						clk_out <= ~clk_out;
					end
			end

endmodule