module mul24(
    input [23:0] num1, num2,
    input clk,
    output reg [47:0] product
);

    wire [47:0] partial_product [23:0];
    wire [23:0] anding [23:0];
    wire [47:0] level1[0:19];
    wire [47:0] level2 [0:13];
    wire [47:0] level3 [0:9];
    wire [47:0] level4 [0:5];
    wire [47:0] level5 [0:4];
    wire [47:0] level6 [0:1];
    wire [47:0] level7 [0:1];
    wire [63:0] sum;
    wire cout, over;

    reg [47:0] reg_pp [0:23];
    reg [47:0] reg_level1 [0:15];
    reg [47:0] reg_level2 [0:10];
    reg [47:0] reg_level3 [0:7];
    reg [47:0] reg_level4 [0:5];
    reg [47:0] reg_level5 [0:3];
    reg [47:0] reg_level6 [0:2];
    reg [47:0] reg_level7 [0:1];


    and partial_product00 [23:0] (anding[00][23:0], num1[23:0], num2[00]);
    and partial_product01 [23:0] (anding[01][23:0], num1[23:0], num2[01]);
    and partial_product02 [23:0] (anding[02][23:0], num1[23:0], num2[02]);
    and partial_product03 [23:0] (anding[03][23:0], num1[23:0], num2[03]);
    and partial_product04 [23:0] (anding[04][23:0], num1[23:0], num2[04]);
    and partial_product05 [23:0] (anding[05][23:0], num1[23:0], num2[05]);
    and partial_product06 [23:0] (anding[06][23:0], num1[23:0], num2[06]);
    and partial_product07 [23:0] (anding[07][23:0], num1[23:0], num2[07]);
    and partial_product08 [23:0] (anding[08][23:0], num1[23:0], num2[08]);
    and partial_product09 [23:0] (anding[09][23:0], num1[23:0], num2[09]);
    and partial_product10 [23:0] (anding[10][23:0], num1[23:0], num2[10]);
    and partial_product11 [23:0] (anding[11][23:0], num1[23:0], num2[11]);
    and partial_product12 [23:0] (anding[12][23:0], num1[23:0], num2[12]);
    and partial_product13 [23:0] (anding[13][23:0], num1[23:0], num2[13]);
    and partial_product14 [23:0] (anding[14][23:0], num1[23:0], num2[14]);
    and partial_product15 [23:0] (anding[15][23:0], num1[23:0], num2[15]);
    and partial_product16 [23:0] (anding[16][23:0], num1[23:0], num2[16]);
    and partial_product17 [23:0] (anding[17][23:0], num1[23:0], num2[17]);
    and partial_product18 [23:0] (anding[18][23:0], num1[23:0], num2[18]);
    and partial_product19 [23:0] (anding[19][23:0], num1[23:0], num2[19]);
    and partial_product20 [23:0] (anding[20][23:0], num1[23:0], num2[20]);
    and partial_product21 [23:0] (anding[21][23:0], num1[23:0], num2[21]);
    and partial_product22 [23:0] (anding[22][23:0], num1[23:0], num2[22]);
    and partial_product23 [23:0] (anding[23][23:0], num1[23:0], num2[23]);

    assign partial_product[00] = anding[00] << 00;
    assign partial_product[01] = anding[01] << 01;
    assign partial_product[02] = anding[02] << 02;
    assign partial_product[03] = anding[03] << 03;
    assign partial_product[04] = anding[04] << 04;
    assign partial_product[05] = anding[05] << 05;
    assign partial_product[06] = anding[06] << 06;
    assign partial_product[07] = anding[07] << 07;
    assign partial_product[08] = anding[08] << 08;
    assign partial_product[09] = anding[09] << 09;
    assign partial_product[10] = anding[10] << 10;
    assign partial_product[11] = anding[11] << 11;
    assign partial_product[12] = anding[12] << 12;
    assign partial_product[13] = anding[13] << 13;
    assign partial_product[14] = anding[14] << 14;
    assign partial_product[15] = anding[15] << 15;
    assign partial_product[16] = anding[16] << 16;
    assign partial_product[17] = anding[17] << 17;
    assign partial_product[18] = anding[18] << 18;
    assign partial_product[19] = anding[19] << 19;
    assign partial_product[20] = anding[20] << 20;
    assign partial_product[21] = anding[21] << 21;
    assign partial_product[22] = anding[22] << 22;
    assign partial_product[23] = anding[23] << 23;

    // level1
    // the reg_pp[30:23] are left
    // reducing 24 + 0 --> 16
    csa48 level1_0 (reg_pp[0] ,reg_pp[8 + 0], reg_pp[16 + 0], level1[0], level1[8 + 0]);
    csa48 level1_1 (reg_pp[1] ,reg_pp[8 + 1], reg_pp[16 + 1], level1[1], level1[8 + 1]);
    csa48 level1_2 (reg_pp[2] ,reg_pp[8 + 2], reg_pp[16 + 2], level1[2], level1[8 + 2]);
    csa48 level1_3 (reg_pp[3] ,reg_pp[8 + 3], reg_pp[16 + 3], level1[3], level1[8 + 3]);
    csa48 level1_4 (reg_pp[4] ,reg_pp[8 + 4], reg_pp[16 + 4], level1[4], level1[8 + 4]);
    csa48 level1_5 (reg_pp[5] ,reg_pp[8 + 5], reg_pp[16 + 5], level1[5], level1[8 + 5]);
    csa48 level1_6 (reg_pp[6] ,reg_pp[8 + 6], reg_pp[16 + 6], level1[6], level1[8 + 6]);
    csa48 level1_7 (reg_pp[7] ,reg_pp[8 + 7], reg_pp[16 + 7], level1[7], level1[8 + 7]);

    // level2
    // the reg_level1[21] is left
    // reducing 15 + 1 --> 10 + 1
    csa48 level2_0 (reg_level1[0], reg_level1[5 + 0], reg_level1[10 + 0], level2[0], level2[5 + 0]);
    csa48 level2_1 (reg_level1[1], reg_level1[5 + 1], reg_level1[10 + 1], level2[1], level2[5 + 1]);
    csa48 level2_2 (reg_level1[2], reg_level1[5 + 2], reg_level1[10 + 2], level2[2], level2[5 + 2]);
    csa48 level2_3 (reg_level1[3], reg_level1[5 + 3], reg_level1[10 + 3], level2[3], level2[5 + 3]);
    csa48 level2_4 (reg_level1[4], reg_level1[5 + 4], reg_level1[10 + 4], level2[4], level2[5 + 4]);

    // level3
    // reducing 9 + 2 --> 6 + 2
    csa48 level3_0 (reg_level2[0], reg_level2[3 + 0], reg_level2[6 + 0], level3[0], level3[3 + 0]);
    csa48 level3_1 (reg_level2[1], reg_level2[3 + 1], reg_level2[6 + 1], level3[1], level3[3 + 1]);
    csa48 level3_2 (reg_level2[2], reg_level2[3 + 2], reg_level2[6 + 2], level3[2], level3[3 + 2]);

    // level4
    // reducing 6 + 2 --> 4 + 1
    // reg_level3[9]
    csa48 level4_0 (reg_level3[0], reg_level3[2 + 0], reg_level3[4 + 0], level4[0], level4[2 + 0]);
    csa48 level4_1 (reg_level3[1], reg_level3[2 + 1], reg_level3[4 + 1], level4[1], level4[2 + 1]);

    // level5
    // reducing 3 + 3 --> 2 + 2
    // reg_level4[6]
    csa48 level5_0 (reg_level4[0], reg_level4[2 + 0], reg_level4[4 + 0], level5[0], level5[2 + 0]);
    csa48 level5_1 (reg_level4[1], reg_level4[2 + 1], reg_level4[4 + 1], level5[1], level5[2 + 1]);

    // level6
    // reducing 3 + 1 --> 2 + 1
    // reg_level5[4]
    csa48 level6_0 (reg_level5[0], reg_level5[1], reg_level5[2], level6[0], level6[1]);

    // level7
    // reducing 3 --> 2
    csa48 level7_0 (reg_level6[0], reg_level6[1], reg_level6[2], level7[0], level7[1]);


    RDCLA64 add_1({16'b0, level7[0][47:0]}, {16'b0, level7[1][47:0]}, 1'b0, clk, cout, sum[63:0]);
    integer i;
    always @(posedge clk)
    begin
        // stage 1
        reg_pp[00][47:0] <= partial_product[00][47:0];
        reg_pp[01][47:0] <= partial_product[01][47:0];
        reg_pp[02][47:0] <= partial_product[02][47:0];
        reg_pp[03][47:0] <= partial_product[03][47:0];
        reg_pp[04][47:0] <= partial_product[04][47:0];
        reg_pp[05][47:0] <= partial_product[05][47:0];
        reg_pp[06][47:0] <= partial_product[06][47:0];
        reg_pp[07][47:0] <= partial_product[07][47:0];
        reg_pp[08][47:0] <= partial_product[08][47:0];
        reg_pp[09][47:0] <= partial_product[09][47:0];
        reg_pp[10][47:0] <= partial_product[10][47:0];
        reg_pp[11][47:0] <= partial_product[11][47:0];
        reg_pp[12][47:0] <= partial_product[12][47:0];
        reg_pp[13][47:0] <= partial_product[13][47:0];
        reg_pp[14][47:0] <= partial_product[14][47:0];
        reg_pp[15][47:0] <= partial_product[15][47:0];
        reg_pp[16][47:0] <= partial_product[16][47:0];
        reg_pp[17][47:0] <= partial_product[17][47:0];
        reg_pp[18][47:0] <= partial_product[18][47:0];
        reg_pp[19][47:0] <= partial_product[19][47:0];
        reg_pp[20][47:0] <= partial_product[20][47:0];
        reg_pp[21][47:0] <= partial_product[21][47:0];
        reg_pp[22][47:0] <= partial_product[22][47:0];
        reg_pp[23][47:0] <= partial_product[23][47:0];

        // stage 2
        reg_level1[00] <= level1[00];
        reg_level1[01] <= level1[01];
        reg_level1[02] <= level1[02];
        reg_level1[03] <= level1[03];
        reg_level1[04] <= level1[04];
        reg_level1[05] <= level1[05];
        reg_level1[06] <= level1[06];
        reg_level1[07] <= level1[07];
        reg_level1[08] <= level1[08];
        reg_level1[09] <= level1[09];
        reg_level1[10] <= level1[10];
        reg_level1[11] <= level1[11];
        reg_level1[12] <= level1[12];
        reg_level1[13] <= level1[13];
        reg_level1[14] <= level1[14];
        reg_level1[15] <= level1[15];

        // stage 3
        reg_level2[00] <= level2[00];
        reg_level2[01] <= level2[01];
        reg_level2[02] <= level2[02];
        reg_level2[03] <= level2[03];
        reg_level2[04] <= level2[04];
        reg_level2[05] <= level2[05];
        reg_level2[06] <= level2[06];
        reg_level2[07] <= level2[07];
        reg_level2[08] <= level2[08];
        reg_level2[09] <= level2[09];
        reg_level2[10] <= reg_level1[15];

        // stage 4
        reg_level3[0] <= level3[0];
        reg_level3[1] <= level3[1];
        reg_level3[2] <= level3[2];
        reg_level3[3] <= level3[3];
        reg_level3[4] <= level3[4];
        reg_level3[5] <= level3[5];
        reg_level3[6] <= reg_level2[9];
        reg_level3[7] <= reg_level2[10];

        // stage 5
        reg_level4[0] <= level4[0];
        reg_level4[1] <= level4[1];
        reg_level4[2] <= level4[2];
        reg_level4[3] <= level4[3];
        reg_level4[4] <= reg_level3[6];
        reg_level4[5] <= reg_level3[7];

        // stage 5
        reg_level5[0] <= level5[0];
        reg_level5[1] <= level5[1];
        reg_level5[2] <= level5[2];
        reg_level5[3] <= level5[3];

        // stage 6
        reg_level6[0] <= level6[0];
        reg_level6[1] <= level6[1];
        reg_level6[2] <= reg_level5[3];

        // stage 7
        reg_level7[0] <= level7[0];
        reg_level7[1] <= level7[1];

        // stage 9
        product <= sum[47:0];
        $display("%b", product);
        
    end
endmodule
module csa48 (
    input [47:0] a, b, c,
    output [47:0] sum, carry
);
    assign carry[0] = 1'b0;
    assign sum[47] = 1'b0;
    csa1 blk [46:0] (a[46:0], b[46:0], c[46:0], sum[46:0], carry[47:1]);
endmodule

module csa1(
	input a,
	input b,
	input c,
	output sum,
	output carry
);
	wire w1, w2, w3;
	xor xor1(w1, b, c);
	xor xor2(sum, w1, a);
	
	and and1(w2, w1, a);
	and and2(w3, b, c);
	or or1(carry, w3, w2);
	
endmodule

module RDCLA64 (
    input [63:0] a, b,
    input cin,
    input clk,
    output reg cout,
    output reg [63:0] sum
);
    wire [64:0] inita, initb;
    wire [64:0] level0a, level0b;
    wire [64:0] level1a, level1b;
    wire [64:0] level2a, level2b;
    wire [64:0] level3a, level3b;
    wire [64:0] level4a, level4b;
    wire [64:0] level5a, level5b;

    assign inita[0] = cin;
    assign initb[0] = cin;
    assign level0a[0] = inita[0];
    assign level0b[0] = initb[0];
    assign level1a[1:0] = level0a[1:0];
    assign level1b[1:0] = level0b[1:0];
    assign level2a[3:0] = level1a[3:0];
    assign level2b[3:0] = level1b[3:0];
    assign level3a[7:0] = level2a[7:0];
    assign level3b[7:0] = level2b[7:0];
    assign level4a[15:0] = level3a[15:0];
    assign level4b[15:0] = level3b[15:0];
    assign level5a[31:0] = level4a[31:0];
    assign level5b[31:0] = level4b[31:0];

    reg [64:0] reglevel0a, reglevel0b;
    reg [64:0] reglevel1a, reglevel1b;
    reg [64:0] reglevel2a, reglevel2b;
    reg [64:0] reglevel3a, reglevel3b;
    reg [64:0] reglevel4a, reglevel4b;
    reg [64:0] reglevel5a, reglevel5b;

    kpg_init initialize [64:1] (a, b, inita[64:1], initb[64:1]);
    
    kpg_sum level0 [64:1] (inita[64:1], initb[64:1], inita[63:0], initb[63:0], level0a[64:1], level0b[64:1]);
    kpg_sum level1 [64:2] (reglevel0a[64:2], reglevel0b[64:2], reglevel0a[62:0], reglevel0b[62:0], level1a[64:2], level1b[64:2]);
    kpg_sum level2 [64:4] (reglevel1a[64:4], reglevel1b[64:4], reglevel1a[60:0], reglevel1b[60:0], level2a[64:4], level2b[64:4]);
    kpg_sum level3 [64:8] (reglevel2a[64:8], reglevel2b[64:8], reglevel2a[56:0], reglevel2b[56:0], level3a[64:8], level3b[64:8]);
    kpg_sum level4 [64:16] (reglevel3a[64:16], reglevel3b[64:16], reglevel3a[48:0], reglevel3b[48:0], level4a[64:16], level4b[64:16]);
    kpg_sum level5 [64:32] (reglevel4a[64:32], reglevel4b[64:32], reglevel4a[32:0], reglevel4b[32:0], level5a[64:32], level5b[64:32]);

    always @(posedge clk)
    begin
        
        reglevel0a <= level0a;
        reglevel0b <= level0b;
        // $display ($time, " level0 a= %d, b= %d", level0a, level0b);
        
            reglevel1a <= level1a;
            reglevel1b <= level1b; 
        // $display ($time, " level1 a= %d, b= %d", level1a, level1b);

            reglevel2a <= level2a;
            reglevel2b <= level2b;
        // $display ($time, " level2 a= %d, b= %d", level2a, level2b);

            reglevel3a <= level3a;
            reglevel3b <= level3b;
        // $display ($time, " level3 a= %d, b= %d", level3a, level3b);

            reglevel4a <= level4a;
            reglevel4b <= level4b;
        // $display ($time, " level4 a= %d, b= %d", level4a, level4b);

            reglevel5a <= level5a;
            reglevel5b <= level5b;

    end
    always @(posedge clk) begin
        sum <= a ^ b ^ level5a[63:0];
        cout <= level5b[64];	
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