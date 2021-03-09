module logical_unit(
    input [7:0] operator,
    input [31:0] op1, op2,
    output reg [31:0] out
);

    wire [31:0] and_out;
    and and_blk [31:0](and_out, op1, op2);

    wire [31:0] xor_out;
    xor xor_blk [31:0](xor_out, op1, op2);

    wire [31:0] nand_out;
    nand nand_blk [31:0](nand_out, op1, op2);

    wire [31:0] not_out;
    not not_blk [31:0](not_out, op1);

    wire [31:0] nor_out;
    nor nor_blk [31:0](nor_out, op1, op2);

    wire [31:0] xnor_out;
    xnor xnor_blk [31:0](xnor_out, op1, op2);

    wire [31:0] or_out;
    or or_blk [31:0](or_out, op1, op2);

    wire [31:0] comp1_out;
    not comp1_blk [31:0](comp1_out, op1);


    always @(*) begin
        case (operator)
            3'b000: begin
                $display($time, " AND");
                out <= and_out;
            end
            3'b001: begin
                $display($time, " XOR");
                out <= xor_out;
            end
            3'b010: begin
                $display($time, " NAND");
                out <= nand_out;
            end
            3'b011: begin
                $display($time, " OR");
                out <= or_out;
            end
            3'b100: begin
                $display($time, " NOT operand 1 taken");
                out <= not_out;
            end
            3'b101: begin
                $display($time, " NOR");
                out <= nor_out;
            end
            3'b110: begin
                $display($time, " 2's Complement");
                out <= comp1_out + 1;
            end
            3'b111: begin
                $display($time, " XNOR");
                out <= xnor_out;
            end
        endcase
    end

endmodule