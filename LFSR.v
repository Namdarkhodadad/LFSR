`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 		Sharif University of Technology (SHINE Lab)
// Engineer: 		Nommy Khodadad
// 
// Create Date:    15:16:56 11/23/2024 
// Design Name: 
// Module Name:    LFSR 
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
module LFSR(
		input clk,
		output [7:0] random
    );

reg [31:0] Seed_num1 = 32'h6BF27D49;
reg [31:0] Seed_num2 = 32'hBB23AF11;
reg [31:0] Seed_num3 = 32'hAAAAAAAA;
reg [31:0] Seed_num4 = 32'h123FED00;
reg [31:0] Seed_num5 = 32'hABFC1533;
reg [31:0] Seed_num6 = 32'h84FABDE1;
reg [31:0] Seed_num7 = 32'h129FBBC6;
reg [31:0] Seed_num8 = 32'hBBC69850;

reg [7:0] rnd;

wire [31:0] Seed_num11;
wire [31:0] Seed_num22;
wire [31:0] Seed_num33;
wire [31:0] Seed_num44;
wire [31:0] Seed_num55;
wire [31:0] Seed_num66;
wire [31:0] Seed_num77;
wire [31:0] Seed_num88;

wire sub_out1;
wire sub_out2;
wire sub_out3;
wire sub_out4;
wire sub_out5;
wire sub_out6;
wire sub_out7;
wire sub_out8;

assign random	 = rnd;

assign sub_out1 = Seed_num1[5] ^~ Seed_num1[22] ^~ Seed_num1[30] ^~ Seed_num1[13];
assign sub_out2 = Seed_num2[2] ^~ Seed_num2[7] ^~ Seed_num2[27] ^~ Seed_num2[16];
assign sub_out3 = Seed_num3[15] ^~ Seed_num3[12] ^~ Seed_num3[20] ^~ Seed_num3[14];
assign sub_out4 = Seed_num4[3] ^~ Seed_num4[2] ^~ Seed_num4[26] ^~ Seed_num4[29];
assign sub_out5 = Seed_num5[18] ^~ Seed_num5[31] ^~ Seed_num5[1] ^~ Seed_num5[10];
assign sub_out6 = Seed_num6[17] ^~ Seed_num6[8] ^~ Seed_num6[6] ^~ Seed_num6[23];
assign sub_out7 = Seed_num7[5] ^~ Seed_num7[22] ^~ Seed_num7[30] ^~ Seed_num7[21];
assign sub_out8 = Seed_num8[24] ^~ Seed_num8[19] ^~ Seed_num8[9] ^~ Seed_num8[4];

assign Seed_num11 = Seed_num1 << 1;
assign Seed_num22 = Seed_num2 << 1;
assign Seed_num33 = Seed_num3 << 1;
assign Seed_num44 = Seed_num4 << 1;
assign Seed_num55 = Seed_num5 << 1;
assign Seed_num66 = Seed_num6 << 1;
assign Seed_num77 = Seed_num7 << 1;
assign Seed_num88 = Seed_num8 << 1;

always @(posedge clk)
    begin
		Seed_num1 	<= {Seed_num11[31:1], sub_out1};
		Seed_num2 	<= {Seed_num22[31:1], sub_out2};
		Seed_num3 	<= {Seed_num33[31:1], sub_out3};
		Seed_num4 	<= {Seed_num44[31:1], sub_out4};
		Seed_num5 	<= {Seed_num55[31:1], sub_out5};
		Seed_num6 	<= {Seed_num66[31:1], sub_out6};
		Seed_num7 	<= {Seed_num77[31:1], sub_out7};
		Seed_num8 	<= {Seed_num88[31:1], sub_out8};
		
		rnd		<= {sub_out7,sub_out8,sub_out3,sub_out1,sub_out6,sub_out2,sub_out5,sub_out4};
		
	 end


endmodule
