`include "fl_mul_32bit.v"
module fl_mul_32bit_tb;

    reg [31:0] in0, in1;
    output [31:0] product;

    fl_mul_32bit block(
        in0, in1, product
    );
    initial 
    begin
        in0 = 32'h40000000;
        in1 = 32'h40000000;
        #5 
        in0 = 32'h41000000;
        in1 = 32'h41000000;
        #5 
        in0 = 32'hc1f00000;
        #5 
        in0 = 32'h42f00000;
        in1 = 32'h41f00000;
    end

    initial begin
        $monitor($time, " in0 = %h, in1 = %h, product = %h", in0, in1, product);	
    end

endmodule