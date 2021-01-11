`include "./headers.v"

module fl_adder_32bit(
    input [31:0] in0,
    input [31:0] in1,
    output reg [31:0] out
);
    reg [31:0] e1, e2;
    reg [31:0] answer;
    reg sel_ans;
    always @(in1 or in0)
    begin 
        if (in0[30:0] == 0 || in1[30:0] == {8'hff, 23'h0})
        begin
            answer <= in1;
            sel_ans = 1'b1;
        end
        else if(in1[30:0] == 0 || in0[30:0] == {8'hff, 23'h0})
        begin
            answer <= in0;
            sel_ans = 1'b1;
        end
        else
        begin
            answer <= 32'hx;
            sel_ans = 1'b0;
        end
    end

    always @(in1 or in0)
    begin
        if (in0[30:23] < in1[30:23])
        begin
            e1 <= in1;
            e2 <= in0;
        end
        else if (in0[30:23] > in1[30:23])
        begin
            e1 <= in0;
            e2 <= in1;
        end
        else if (in0[22:0] < in1[22:0])
        begin
            e1 <= in1;
            e2 <= in0;
        end

        else if (in0[22:0] > in1[22:0])
        begin
            e1 <= in0;
            e2 <= in1;
        end
        else if (in1[31] !== in0[31])
        begin
            e1 <= 0;
            e2 <= 0;
        end
        else 
        begin
            e1 <= in1;
            e2 <= in0;
        end
    end

    reg cin;
    reg [7:0] d;
    reg [23:0] num1;
    reg [23:0] num2;
    always @(e1 or e2)
    begin
        d <= e1[30:23] - e2[30:23];
        if (e1[31] ^ e2[31] == 0)       // same sign
        begin
            cin <= 1'b0;
            num1 <= {1'b1, e1[22:0]};
            num2 <= {1'b1, e2[22:0]};
        end
        else                            // different signs
        begin
            cin <= 1'b1;
            num1 <= {1'b1, e1[22:0]};
            num2 <= (~{1'b1, e2[22:0]});
        end
    end
    
    wire [23:0] shifted;
    right_shifter25bit shifter(
        num2,
        d,
        shifted
    );

    wire [31:0] sum;
    wire cout;

    RD_CLA adder(
        {8'h0, num1}, 
        {8'h0, shifted},
        cin,
        sum, 
        cout
    );
    
    always@(*)
    begin
        if (sel_ans == 1)
        begin
            out <= answer;
        end
        else if (sum[24] == 1 && e1 != 0)
        begin
            out[31] <= e1[31];
            out[30:23] <= e1[30:23] + 1;
            out[22:0] <= sum[23:1];
        end
        else
        begin
            out[31:23] <= e1[31:23];
            out[22:0] <= sum[22:0];
        end
    end

endmodule