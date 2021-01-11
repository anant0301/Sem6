module right_shifter25bit (
        input [23:0] in,
        input [7:0] sh,
        output reg [23:0]  out
    );

    reg [23:0] l0, l1, l2, l3, l4;

    always @(in or sh)
    begin
        if (sh[0] == 1)
        begin
            l0 <= in >> 1;            
        end
        else
        begin
            l0 <= in;
        end
    end

    always @(l0)
    begin
        if (sh[1] == 1)
        begin
            l1 <= in >> 2;            
        end
        else
        begin
            l1 <= l0;
        end
    end


    always @(l1)
    begin
        if (sh[2] == 1)
        begin
            l2 <= l1 >> 4;            
        end
        else
        begin
            l2 <= l1;
        end
    end


    always @(l2)
    begin
        if (sh[3] == 1)
        begin
            l3 <= l2 >> 8;            
        end
        else
        begin
            l3 <= l2;
        end
    end

    always @(l3)
    begin
        if (sh[4] == 1)
        begin
            l4 <= l3 >> 16;            
        end
        else
        begin
            l4 <= l3;
        end
    end

    always @(l4)
    begin
        if (sh[7:5] != 0)
        begin
            out <= 23'b0;            
        end
        else
        begin
            out <= l4;
        end
    end

endmodule