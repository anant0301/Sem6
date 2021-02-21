module mul24(
    input [23:0] num1, num2,
    input clk,
    output reg [63:0] product
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
    wire [47:0] level8 [0:1];
    wire [47:0] sum;
    wire cout, over; 

    reg [47:0] reg_pp [0:23];
    reg [47:0] reg_level1 [0:21];
    reg [47:0] reg_level2 [0:14];
    reg [47:0] reg_level3 [0:9];
    reg [47:0] reg_level4 [0:6];
    reg [47:0] reg_level5 [0:4];
    reg [47:0] reg_level6 [0:3];
    reg [47:0] reg_level7 [0:2];
    reg [47:0] reg_level8 [0:1];


    and partial_product00 [23:0] (anding[00], num1[23:0], num2[00]);
    and partial_product01 [23:0] (anding[01], num1[23:0], num2[01]);
    and partial_product02 [23:0] (anding[02], num1[23:0], num2[02]);
    and partial_product03 [23:0] (anding[03], num1[23:0], num2[03]);
    and partial_product04 [23:0] (anding[04], num1[23:0], num2[04]);
    and partial_product05 [23:0] (anding[05], num1[23:0], num2[05]);
    and partial_product06 [23:0] (anding[06], num1[23:0], num2[06]);
    and partial_product07 [23:0] (anding[07], num1[23:0], num2[07]);
    and partial_product08 [23:0] (anding[08], num1[23:0], num2[08]);
    and partial_product09 [23:0] (anding[09], num1[23:0], num2[09]);
    and partial_product10 [23:0] (anding[10], num1[23:0], num2[10]);
    and partial_product11 [23:0] (anding[11], num1[23:0], num2[11]);
    and partial_product12 [23:0] (anding[12], num1[23:0], num2[12]);
    and partial_product13 [23:0] (anding[13], num1[23:0], num2[13]);
    and partial_product14 [23:0] (anding[14], num1[23:0], num2[14]);
    and partial_product15 [23:0] (anding[15], num1[23:0], num2[15]);
    and partial_product16 [23:0] (anding[16], num1[23:0], num2[16]);
    and partial_product17 [23:0] (anding[17], num1[23:0], num2[17]);
    and partial_product18 [23:0] (anding[18], num1[23:0], num2[18]);
    and partial_product19 [23:0] (anding[19], num1[23:0], num2[19]);
    and partial_product20 [23:0] (anding[20], num1[23:0], num2[20]);
    and partial_product21 [23:0] (anding[21], num1[23:0], num2[21]);
    and partial_product22 [23:0] (anding[22], num1[23:0], num2[22]);
    and partial_product23 [23:0] (anding[23], num1[23:0], num2[23]);
    and partial_product24 [23:0] (anding[24], num1[23:0], num2[24]);
    and partial_product25 [23:0] (anding[25], num1[23:0], num2[25]);
    and partial_product26 [23:0] (anding[26], num1[23:0], num2[26]);
    and partial_product27 [23:0] (anding[27], num1[23:0], num2[27]);
    and partial_product28 [23:0] (anding[28], num1[23:0], num2[28]);
    and partial_product29 [23:0] (anding[29], num1[23:0], num2[29]);
    and partial_product30 [23:0] (anding[30], num1[23:0], num2[30]);
    and partial_product31 [23:0] (anding[23], num1[23:0], num2[23]);


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
    // reducing 30 + 2 --> 20 + 2
    csa64 level1_0 (reg_pp[0] ,reg_pp[10], reg_pp[20], level1[00], level1[10]);
    csa64 level1_1 (reg_pp[1] ,reg_pp[11], reg_pp[21], level1[01], level1[11]);
    csa64 level1_2 (reg_pp[2] ,reg_pp[12], reg_pp[22], level1[02], level1[12]);
    csa64 level1_3 (reg_pp[3] ,reg_pp[13], reg_pp[23], level1[03], level1[13]);
    csa64 level1_4 (reg_pp[4] ,reg_pp[14], reg_pp[24], level1[04], level1[14]);
    csa64 level1_5 (reg_pp[5] ,reg_pp[15], reg_pp[25], level1[05], level1[15]);
    csa64 level1_6 (reg_pp[6] ,reg_pp[16], reg_pp[26], level1[06], level1[16]);
    csa64 level1_7 (reg_pp[7] ,reg_pp[17], reg_pp[27], level1[07], level1[17]);
    csa64 level1_8 (reg_pp[8] ,reg_pp[18], reg_pp[28], level1[08], level1[18]);
    csa64 level1_9 (reg_pp[9] ,reg_pp[19], reg_pp[29], level1[09], level1[19]);

    // level2
    // the reg_level1[21] is left
    // reducing 21 + 1 --> 14 + 1
    csa64 level2_0 (reg_level1[0], reg_level1[7 + 0], reg_level1[14 + 0], level2[0], level2[7 + 0]);
    csa64 level2_1 (reg_level1[1], reg_level1[7 + 1], reg_level1[14 + 1], level2[1], level2[7 + 1]);
    csa64 level2_2 (reg_level1[2], reg_level1[7 + 2], reg_level1[14 + 2], level2[2], level2[7 + 2]);
    csa64 level2_3 (reg_level1[3], reg_level1[7 + 3], reg_level1[14 + 3], level2[3], level2[7 + 3]);
    csa64 level2_4 (reg_level1[4], reg_level1[7 + 4], reg_level1[14 + 4], level2[4], level2[7 + 4]);
    csa64 level2_5 (reg_level1[5], reg_level1[7 + 5], reg_level1[14 + 5], level2[5], level2[7 + 5]);
    csa64 level2_6 (reg_level1[6], reg_level1[7 + 6], reg_level1[14 + 6], level2[6], level2[7 + 6]);

    // level3
    // reducing 15 + 0 --> 10 + 0
    csa64 level3_0 (reg_level2[0], reg_level2[5 + 0], reg_level2[10 + 0], level3[0], level3[5 + 0]);
    csa64 level3_1 (reg_level2[1], reg_level2[5 + 1], reg_level2[10 + 1], level3[1], level3[5 + 1]);
    csa64 level3_2 (reg_level2[2], reg_level2[5 + 2], reg_level2[10 + 2], level3[2], level3[5 + 2]);
    csa64 level3_3 (reg_level2[3], reg_level2[5 + 3], reg_level2[10 + 3], level3[3], level3[5 + 3]);
    csa64 level3_4 (reg_level2[4], reg_level2[5 + 4], reg_level2[10 + 4], level3[4], level3[5 + 4]);

    // level4
    // reducing 9 + 1 --> 6 + 1
    // reg_level3[9]
    csa64 level4_0 (reg_level3[0], reg_level3[3 + 0], reg_level3[6 + 0], level4[0], level4[3 + 0]);
    csa64 level4_1 (reg_level3[1], reg_level3[3 + 1], reg_level3[6 + 1], level4[1], level4[3 + 1]);
    csa64 level4_2 (reg_level3[2], reg_level3[3 + 2], reg_level3[6 + 2], level4[2], level4[3 + 2]);

    // level5
    // reducing 6 + 1 --> 4 + 1
    // reg_level4[6]
    csa64 level5_0 (reg_level4[0], reg_level4[2 + 0], reg_level4[4 + 0], level5[0], level5[2 + 0]);
    csa64 level5_1 (reg_level4[1], reg_level4[2 + 1], reg_level4[4 + 1], level5[1], level5[2 + 1]);

    // level6
    // reducing 3 + 2 --> 2 + 2
    // reg_level5[4]
    csa64 level6_0 (reg_level5[0], reg_level5[1], reg_level5[2], level6[0], level6[1]);

    // level7
    // reducing 3 + 1 --> 2 + 1
    // reg_level6[3]
    csa64 level7_0 (reg_level6[0], reg_level6[1], reg_level6[2], level7[0], level7[1]);

    // level8
    // reducing 3 + 0 --> 2 + 0
    csa64 level8_0 (reg_level7[0], reg_level7[1], reg_level7[2], level8[0], level8[1]);

    RD_CLA add_1(level8[0][23:0], level8[1][23:0], 1'b0, sum[23:0], cout);
    RD_CLA add_2(level8[0][47:32], level8[1][47:32], cout, sum[47:32], over);
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
        reg_pp[24][47:0] <= partial_product[24][47:0];
        reg_pp[25][47:0] <= partial_product[25][47:0];
        reg_pp[26][47:0] <= partial_product[26][47:0];
        reg_pp[27][47:0] <= partial_product[27][47:0];
        reg_pp[28][47:0] <= partial_product[28][47:0];
        reg_pp[29][47:0] <= partial_product[29][47:0];
        reg_pp[30][47:0] <= partial_product[30][47:0];
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
        reg_level1[16] <= level1[16];
        reg_level1[17] <= level1[17];
        reg_level1[18] <= level1[18];
        reg_level1[19] <= level1[19];
        reg_level1[20] <= reg_pp[30];
        reg_level1[21] <= reg_pp[23];

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
        reg_level2[10] <= level2[10];
        reg_level2[11] <= level2[11];
        reg_level2[12] <= level2[12];
        reg_level2[13] <= level2[13];
        reg_level2[14] <= reg_level1[21];

        // stage 4
        reg_level3[0] <= level3[0];
        reg_level3[1] <= level3[1];
        reg_level3[2] <= level3[2];
        reg_level3[3] <= level3[3];
        reg_level3[4] <= level3[4];
        reg_level3[5] <= level3[5];
        reg_level3[6] <= level3[6];
        reg_level3[7] <= level3[7];
        reg_level3[8] <= level3[8];
        reg_level3[9] <= level3[9];

        // stage 5
        reg_level4[0] <= level4[0];
        reg_level4[1] <= level4[1];
        reg_level4[2] <= level4[2];
        reg_level4[3] <= level4[3];
        reg_level4[4] <= level4[4];
        reg_level4[5] <= level4[5];
        reg_level4[5] <= level4[5];
        reg_level4[6] <= reg_level3[9];

        // stage 5
        reg_level5[0] <= level5[0];
        reg_level5[1] <= level5[1];
        reg_level5[2] <= level5[2];
        reg_level5[3] <= level5[3];
        reg_level5[4] <= reg_level4[6];

        // stage 6
        reg_level6[0] <= level6[0];
        reg_level6[1] <= level6[1];
        reg_level6[2] <= reg_level5[3];
        reg_level6[3] <= reg_level5[4];

        // stage 7
        reg_level7[0] <= level7[0];
        reg_level7[1] <= level7[1];
        reg_level7[2] <= reg_level6[3];

        // stage 8
        reg_level8[0] <= level8[0];
        reg_level8[1] <= level8[1];

        // stage 9
        product <= sum;
        // for (i = 0; i< 32; ++i) 
        // begin
        //     $display ($time, " i= %d %h", i, partial_product[i]); 
        // end
    end
endmodule
module csa48 (
    input [47:0] a, b, c,
    output [47:0] sum, carry
);
    assign carry[0] = 1'b0;
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