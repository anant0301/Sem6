module mux(
    input in0,
    input in1,
    input sel,
    output out
);
    reg out_reg;
    always@(sel)
    begin
        case (sel)
            1'b0    : out_reg = in0;
            1'b1    : out_reg = in1;
            default : out_reg = 1'bx;
        endcase
    end
    assign out = out_reg; 
endmodule