`include "logical_unit.v"
module tb;

    reg [31:0] operand1;
    reg [31:0] operand2;
    reg [7:0] operator;
    output [31:0] out;

    logical_unit blk_log(
        operator,
        operand1,
        operand2,
        out
    );

    initial begin
        $display("0) bitwise AND \n1) bitwise XOR \n2) bitwise NAND \n3) bitwise OR \n4) bitwise NOT \n5) bitwise NOR \n6) 2's Complement \n7) bitwise XNOR \n");
    end

    initial begin
        operand1 = 32'hffffffff;
        operand2 = 32'h0;
        operator = 8'h0;
#5
        operator = 8'h1;
#5
        operator = 8'h2;
#5
        operator = 8'h3;
#5
        operator = 8'h4;
#5
        operator = 8'h5;
#5
        operator = 8'h6;
#5
        operator = 8'h7;
    end

    initial begin
        $monitor($time, "operand1= %h, operand2= %h, operator= %h, out= %h", operand1, operand2, operator, out);
    end


endmodule