module left_shifter56bit (
        input [55:0] in,
        input [3:0] sh,
        output reg [46:0]  out
    );

    reg [51:0] l0;
    reg [49:0] l1;

    always @(in or sh)
    begin
        else if (sh[2] == 1)
        begin
            l0 <= in[55:4];            
        end
        else
        begin
            l0 <= in[51:0];
        end
    end

    always @(l0)
    begin
        if (sh[1] == 1)
        begin
            l1 <= l0[51:2];            
        end
        else
        begin
            l1 <= l0[49:0];
        end
    end

    always @(l1)
    begin
        if (sh[2] == 1)
        begin
            out <= l1[49:1];            
        end
        else
        begin
            out <= l1[48:0];
        end
    end

endmodule