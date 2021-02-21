module fl_adder32(
    input [31:0] in0,
    input [31:0] in1,
    input clk,
    output reg [31:0] out
);
    reg [31:0] e1, e2;
    reg [31:0] answer;
    reg sel_ans, cin;
    always @(posedge clk)
    begin 
        if (in0[30:0] == 0 || in1[30:0] == {8'hff, 23'h0}) begin
            answer <= #1 in1;
            sel_ans <= #1 1'b1;
        end
        else if(in1[30:0] == 0 || in0[30:0] == {8'hff, 23'h0}) begin
            answer <= #1 in0;
            sel_ans <= #1 1'b1;
        end
        else begin
            answer <= #1 32'hx;
            sel_ans <= #1 1'b0;
        end
    // end
    // always @(posedge clk) begin
        if (in1[30:0] < in0[30:0]) begin
           e1 <= #1 in0;
           e2[22:0] <= #1 in1[22:0];
       end
       else if (in1[30:0] > in0[30:0]) begin
           e1 <= #1 in1;
           e2[22:0] <= #1 in0[22:0];
       end
       else if (in1[31] ^ in0[31] == 1) begin
           sel_ans = 1;
           answer <= #1 0;
       end
       else begin
           e1 <= #1 in1;
           e2[22:0] <= #1 in0[22:0];
       end

        if (in1[31] ^ in0[31] == 1) begin
            e2[30:23] = ~in0[30:23];
            cin <= #1 1'b1;
        end
        else begin
            e2[30:23] = in0[30:23];
            cin <= #1 1'b0;
        end
    end

    wire diff_cout;
    wire [7:0] exp_diff;
    reg [7:0] diff;
    RDCLA8 difference_exp (
        e1[30:23],
        e2[30:23],
        cin, clk,
        diff_cout,
        exp_diff
    );

    always @(exp_diff) begin
        out[31] <= #1 e1[31];
        diff <= #1 exp_diff;
    end

    wire [23:0] shifted;

    right_shifter25bit shifting (
        {1'b1, e2[22:0]},
        diff[7:0],
        shifted
    );
    reg [23:0] shifted_e2;
    reg [23:0] shifted_e1;
    always @(shifted) begin
        shifted_e2 <= #1 shifted;
        shifted_e1 <= #1 {1'b1, e1};
    end

    wire cout;
    wire [31:0] sum;
    RDCLA32 adder (
        {8'h0, shifted_e1},
        {8'h0, shifted_e2},
        cin, clk, 
        cout, sum
    );

    always@(*)
    begin
        if (sel_ans == 1) begin
            out <= #1 answer;
        end
        else if (sum[24] == 1 && e1 != 0) begin
            out[31] <= #1 e1[31];
            out[30:23] <= #1 e1[30:23] + 1;
            out[22:0] <= #1 sum[23:1];
        end
        else begin
            out[31:23] <= #1 e1[31:23];
            out[22:0] <= #1 sum[22:0];
        end
    end
endmodule

module RDCLA8 (
    input [7:0] a, b,
    input cin,
    input clk,
    output reg cout,
    output reg [7:0] sum
);
    wire [8:0] inita, initb;
    wire [8:0] level0a, level0b;
    wire [8:0] level1a, level1b;
    wire [8:0] level2a, level2b;
    assign inita[0] = cin;
    assign initb[0] = cin;
    assign level0a[0] = inita[0];
    assign level0b[0] = initb[0];
    assign level1a[1:0] = level0a[1:0];
    assign level1b[1:0] = level0b[1:0];
    assign level2a[3:0] = level1a[3:0];
    assign level2b[3:0] = level1b[3:0];
    reg [8:0] reglevel0a, reglevel0b;
    reg [8:0] reglevel1a, reglevel1b;
    reg [8:0] reglevel2a, reglevel2b;
    kpg_init initialize [8:1] (a, b, inita[8:1], initb[8:1]);
    kpg_sum level0 [8:1] (inita[8:1], initb[8:1], inita[7:0], initb[7:0], level0a[8:1], level0b[8:1]);
    kpg_sum level1 [8:2] (reglevel0a[8:2], reglevel0b[8:2], reglevel0a[6:0], reglevel0b[6:0], level1a[8:2], level1b[8:2]);
    kpg_sum level2 [8:4] (reglevel1a[8:4], reglevel1b[8:4], reglevel1a[4:0], reglevel1b[4:0], level2a[8:4], level2b[8:4]);
    always @(posedge clk)
    begin
        reglevel0a <= #1 level0a;
        reglevel0b <= #1 level0b;
        // $display ($time, " level0 a= %d, b= %d", level0a, level0b);
        reglevel1a <= #1 level1a;
        reglevel1b <= #1 level1b; 
        // $display ($time, " level1 a= %d, b= %d", level1a, level1b);
        reglevel2a <= #1 level2a;
        reglevel2b <= #1 level2b;
        // $display ($time, " level2 a= %d, b= %d", level2a, level2b);
    end
    always @(posedge clk) begin
        sum <= #1 a ^ b ^ level2a[7:0];
        cout <= #1 level2b[8];	
        // $display ($time, " answer sum= %d, cout= %d", sum, cout);
    end


endmodule

module RDCLA32 (
    input [31:0] a, b,
    input cin,
    input clk,
    output reg cout,
    output reg [31:0] sum
);
    wire [32:0] inita, initb;
    wire [32:0] level0a, level0b;
    wire [32:0] level1a, level1b;
    wire [32:0] level2a, level2b;
    wire [32:0] level3a, level3b;
    wire [32:0] level4a, level4b;

    assign inita[0] = cin;
    assign initb[0] = cin;
    assign level0a[0] = inita[0];
    assign level0b[0] = initb[0];
    assign level1a[1:0] = level0a[1:0];
    assign level1b[1:0] = level0b[1:0];
    assign level2a[3:0] = level1a[3:0];
    assign level2b[3:0] = level1b[3:0];
    assign level3a[7:0] = level1a[7:0];
    assign level3b[7:0] = level1b[7:0];
    assign level4a[15:0] = level1a[15:0];
    assign level4b[15:0] = level1b[15:0];

    reg [32:0] reglevel0a, reglevel0b;
    reg [32:0] reglevel1a, reglevel1b;
    reg [32:0] reglevel2a, reglevel2b;
    reg [32:0] reglevel3a, reglevel3b;
    reg [32:0] reglevel4a, reglevel4b;

    kpg_init initialize [32:1] (a, b, inita[32:1], initb[32:1]);
    
    kpg_sum level0 [32:1] (inita[32:1], initb[32:1], inita[31:0], initb[31:0], level0a[32:1], level0b[32:1]);
    kpg_sum level1 [32:2] (reglevel0a[32:2], reglevel0b[32:2], reglevel0a[30:0], reglevel0b[30:0], level1a[32:2], level1b[32:2]);
    kpg_sum level2 [32:4] (reglevel1a[32:4], reglevel1b[32:4], reglevel1a[28:0], reglevel1b[28:0], level2a[32:4], level2b[32:4]);
    kpg_sum level3 [32:8] (reglevel2a[32:8], reglevel2b[32:8], reglevel2a[24:0], reglevel2b[24:0], level3a[32:8], level3b[32:8]);
    kpg_sum level4 [32:16] (reglevel3a[32:16], reglevel3b[32:16], reglevel3a[16:0], reglevel3b[16:0], level4a[32:16], level4b[32:16]);

    always @(posedge clk)
    begin
        
        reglevel0a <= #1 level0a;
        reglevel0b <= #1 level0b;
        // $display ($time, " level0 a= %d, b= %d", level0a, level0b);
        
            reglevel1a <= #1 level1a;
            reglevel1b <= #1 level1b; 
        // $display ($time, " level1 a= %d, b= %d", level1a, level1b);

            reglevel2a <= #1 level2a;
            reglevel2b <= #1 level2b;
        // $display ($time, " level2 a= %d, b= %d", level2a, level2b);

            reglevel3a <= #1 level3a;
            reglevel3b <= #1 level3b;
        // $display ($time, " level3 a= %d, b= %d", level3a, level3b);

            reglevel4a <= #1 level4a;
            reglevel4b <= #1 level4b;
        // $display ($time, " level4 a= %d, b= %d", level4a, level4b);
    end
    always @(posedge clk) begin
        sum <= #1 a ^ b ^ level4a[31:0];
        cout <= #1 level4b[32];	
        // $display ($time, " answer sum= %d, cout= %d", sum, cout);
    end


endmodule

module kpg_init (
    input a, b,
    output reg out0, out1
);

    always @*
    case ({a, b})
        2'b00: begin
            out0 = 1'b0; out1 = 1'b0;
        end
        2'b11: begin
            out0 = 1'b1; out1 = 1'b1;
        end
        default: begin 
            out0 = 1'b0; out1 = 1'b1;
        end
    endcase

endmodule

module kpg_sum (
    input cur_bit_1, cur_bit_0, prev_bit_1, prev_bit_0,
    output reg out_bit_1, out_bit_0
);
    always @(*)
    begin
        case ({cur_bit_1, cur_bit_0})
            2'b00:      {out_bit_1, out_bit_0} = 2'b00;
            2'b11:      {out_bit_1, out_bit_0} = 2'b11; 
            default:    {out_bit_1, out_bit_0} = {prev_bit_1, prev_bit_0};

        endcase
    end

endmodule

module right_shifter25bit (
        input [23:0] in,
        input [7:0] sh,
        output reg [23:0] out
    );

    reg [23:0] l0, l1, l2, l3, l4;

    always @(in or sh)
    begin
        if (sh[0] == 1) begin
            l0 <= in >> 1;            
        end
        else begin
            l0 <= in;
        end
    end

    always @(l0)
    begin
        if (sh[1] == 1) begin
            l1 <= in >> 2;            
        end
        else begin
            l1 <= l0;
        end
    end


    always @(l1)
    begin
        if (sh[2] == 1) begin
            l2 <= l1 >> 4;            
        end
        else begin
            l2 <= l1;
        end
    end


    always @(l2)
    begin
        if (sh[3] == 1) begin
            l3 <= l2 >> 8;            
        end
        else begin
            l3 <= l2;
        end
    end

    always @(l3)
    begin
        if (sh[4] == 1) begin
            l4 <= l3 >> 16;            
        end
        else begin
            l4 <= l3;
        end
    end

    always @(l4)
    begin
        if (sh[7:5] != 0) begin
            out <= 23'b0;            
        end
        else begin
            out <= l4;
        end
    end

endmodule