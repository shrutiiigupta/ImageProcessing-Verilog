`timescale 1ps / 100fs
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 19.03.2022 22:01:26
// Design Name: 
// Module Name: Main
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module Main(
    input clk,
    input[1:0] select,
    input[7:0] value,threshold,in_byte,
    output[0:7] out_byte
);
reg[0:7] parser;
    always @(posedge clk)
        case(select)
            2'b00: parser = (in_byte > (8'b11111111 - value))? (8'b11111111) : (in_byte + value);
            //2'b00: parser <= in_byte + value;
            2'b01: parser = (in_byte < value)? (8'b00000000) : (in_byte - value);
            2'b10: parser = (in_byte > threshold)? (8'b11111111) : (8'b00000000);
            2'b11: parser = 8'b11111111 - in_byte;
        endcase    
        assign out_byte = parser;
endmodule



//Testbench
module Image_parser;
reg[7:0] threshold,value;
reg[1:0] select;
reg clk;
reg[7:0] inp[98303:0];
reg[7:0] out[98303:0];
reg[7:0] in_byte;
wire[7:0] out_byte; ;

Main M1(clk,select,value,threshold,in_byte,out_byte);

initial 
begin
    clk = 1'b1;
    forever
        #5 clk = ~clk;
end

initial
begin
    value   <= 8'b00111100;
    threshold <= 8'b10100000;
    select <= 2'b11; 
    $readmemb("D:/codes/python/ImgToText/img.txt",inp);
    
end

integer i;

initial
begin
#5 in_byte <= inp[0];
#7out[0] = out_byte; 
$display("input : %b  output : %b ",inp[0],out[0]);
for (i=1;i<98304;i=i+1)
    begin
    #5 in_byte <= inp[i];
    #5 out[i] = out_byte; 
    $display("input : %b  output : %b ",inp[i],out[i]);
    end
    #8 select = select + 2'b01;
    $writememb("D:/codes/python/ImgToText/Outtimg.txt",out);
    
#10 $finish;
    
end
endmodule
