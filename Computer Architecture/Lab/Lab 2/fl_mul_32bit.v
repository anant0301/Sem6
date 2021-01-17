`include"wallace_tree32bit.v"
`include"mux.v"
`include"RD_CLA.v"

module fl_mul_32bit(
    input [31:0] in0,
    input [31:0] in1,
    output reg [31:0] product
);
    reg [31:0] answer;
    reg sel_ans;
    always @(in1 or in0)
    begin 
        if (in0[30:0] == 0 || in0[30:23] == 8'hff)
        begin
            answer <= in0;
            sel_ans = 1'b1;
        end
        else if(in1[30:0] == 0 || in1[30:23] == 8'hff)
        begin
            answer <= in1;
            sel_ans = 1'b1;
        end
        else
        begin
            answer <= 32'hx;
            sel_ans = 1'b0;
        end
    end

    wire [23:0] num0, num1;
    assign num0 = {1'b1, in0[22:0]};
    assign num1 = {1'b1, in1[22:0]};

    wire [7:0] exp0, exp1;
    assign exp0 = in0[30:23];
    assign exp1 = in1[30:23];


    wire cin;
    xor x1(cin, in0[31], in1[31]);  

    wire [23:0] num1_comp;
    not n0 [23:0] (num1_comp, num1[23:0]);
    wire [23:0] _num1_;

    mux compl[23:0] (num0[23:0], num1[23:0], product[31], _num1_[23:0]);

    wire [31:0] exp_sum;
    RD_CLA r1(
        {24'd0, exp0},
        {24'd0, exp1},
	    cin,
	    exp_sum
    );

    wire [63:0] out;
    wallace_tree32bit w1(
        {8'h0, num0},
        {8'h0, _num1_},
        out
    );

    wire shifting;
    mux shifter(1'b0, 1'b1, out[47], shifting);

    wire [31:0] new_exp;
    RD_CLA r2(
        exp_sum,
        {31'd0, shifting},
	    1'b0,
	    new_exp
    );

    wire [31:0] fin_exp;

    RD_CLA r3(
        new_exp,
        ~32'd127,
	    1'b1,
	    fin_exp
    );

    always@(*)
    begin
        if (sel_ans)
        begin
            product = sel_ans;
        end
        else
        begin
            product[30:23] = fin_exp[7:0];
            if (shifting == 1)
            begin
                product[22:0] = out[46:24];            
            end
            else
            begin
                product[22:0] = out[45:23];            
            end
            product[31] = cin;
        end
    end

endmodule