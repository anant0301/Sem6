`include "specs.v"
`ifndef SPECS
`define SPECS

`define BITS_PER_WORD 32
`define WORDS_PER_BLOCK 16
`define BLOCKS_PER_CACHE 1024

`define BLOCK_SELECT_LINE 4
`define CACHE_SELECT_LINE 10


`endif SPECS

module cache(
);

    block [1023:0] cache;

endmodule


module block(
    input read,
    input write,
    inout valid,
    inout dirty,
    input [BLOCK_SELECT_LINE - 1:0] sel_line,
    input [BITS_PER_WORD - 1:0] write_data,
    output [BITS_PER_WORD - 1:0] read_data
);
    // word length = 32 bits and 16 words in a block
    reg [BITS_PER_WORD - 1:0] words [WORDS_PER_BLOCK:0];
    reg valid_bit [WORDS_PER_BLOCK:0];
    reg dirty_bit [WORDS_PER_BLOCK:0];
    always @(read | write) 
    begin
        if (read == 1 && dirty_bit[sel_line] == 1)
        begin
            read_data <= word[sel_line];
            valid <= valid_bit[sel_line];
            dirty <= dirty_bit[sel_line];
        end
        else
        begin
            read_data <= 32'hx;
        end

        if (write == 1)
        begin
            word[sel_line] <= write_data;
            valid_bit[sel_line] <= valid;
            dirty_bit[sel_line] <= dirty;
        end
        else 
        begin
            word[sel_line] <= word[sel_line];
            dirty_bit[sel_line] <= dirty;
            valid_bit[sel_line] <= valid;
        end
    end
endmodule