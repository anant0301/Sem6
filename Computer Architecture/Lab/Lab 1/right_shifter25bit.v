module right_shifter25bit (
        input [23:0] in,
        input [7:0] sh,
        output reg [23:0]  out
    );
    always @(in or sh)
    begin
        out = in >> sh;
    end
endmodule