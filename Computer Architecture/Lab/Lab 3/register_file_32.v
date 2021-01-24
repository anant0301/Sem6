module register_file_32(
    input [4:0] select_line1,
    input [4:0] select_line2,
    input [4:0] write_select_line,
    input [31:0] write_data,
    input clk,
    input read_sel,
    input write_sel,
    output reg [31:0] reg_data1,
    output reg [31:0] reg_data2
);

    reg [31:0] reg_file [0:31];
    initial 
    begin
        reg_file[0] <= 0;
        reg_file[1] <= 1;
        reg_file[2] <= 2;
        reg_file[3] <= 3;
        reg_file[4] <= 4;
        reg_file[5] <= 5;
        reg_file[6] <= 6;
        reg_file[7] <= 7;
        reg_file[8] <= 8;
        reg_file[9] <= 9;
        reg_file[10] <= 10;
        reg_file[11] <= 11;
        reg_file[12] <= 12;
        reg_file[13] <= 13;
        reg_file[14] <= 14;
        reg_file[15] <= 15;
        reg_file[16] <= 16;
        reg_file[17] <= 17;
        reg_file[18] <= 18;
        reg_file[19] <= 19;
        reg_file[20] <= 20;
        reg_file[21] <= 21;
        reg_file[22] <= 22;
        reg_file[23] <= 23;
        reg_file[24] <= 24;
        reg_file[25] <= 25;
        reg_file[26] <= 26;
        reg_file[27] <= 27;
        reg_file[28] <= 28;
        reg_file[29] <= 29;
        reg_file[30] <= 30;
        reg_file[31] <= 31;    
    end

    wire [31:0] read_data1;
    wire [31:0] read_data2;
    mux32_1 mux32_1_blk1 [31:0] (
    reg_file[0][31:0], reg_file[1][31:0], reg_file[2][31:0], reg_file[3][31:0], reg_file[4][31:0], reg_file[5][31:0], reg_file[6][31:0], reg_file[7][31:0], reg_file[8][31:0], reg_file[9][31:0],
    reg_file[10][31:0], reg_file[11][31:0], reg_file[12][31:0], reg_file[13][31:0], reg_file[14][31:0], reg_file[15][31:0], reg_file[16][31:0], reg_file[17][31:0], reg_file[18][31:0], reg_file[19][31:0],
    reg_file[20][31:0], reg_file[21][31:0], reg_file[22][31:0], reg_file[23][31:0], reg_file[24][31:0], reg_file[25][31:0], reg_file[26][31:0], reg_file[27][31:0], reg_file[28][31:0], reg_file[29][31:0],
    reg_file[30][31:0], reg_file[31][31:0],
    select_line1[4:0],
    read_data1[31:0]
    );

    mux32_1 mux32_1_blk2 [31:0] (
    reg_file[0][31:0], reg_file[1][31:0], reg_file[2][31:0], reg_file[3][31:0], reg_file[4][31:0], reg_file[5][31:0], reg_file[6][31:0], reg_file[7][31:0], reg_file[8][31:0], reg_file[9][31:0],
    reg_file[10][31:0], reg_file[11][31:0], reg_file[12][31:0], reg_file[13][31:0], reg_file[14][31:0], reg_file[15][31:0], reg_file[16][31:0], reg_file[17][31:0], reg_file[18][31:0], reg_file[19][31:0],
    reg_file[20][31:0], reg_file[21][31:0], reg_file[22][31:0], reg_file[23][31:0], reg_file[24][31:0], reg_file[25][31:0], reg_file[26][31:0], reg_file[27][31:0], reg_file[28][31:0], reg_file[29][31:0],
    reg_file[30][31:0], reg_file[31][31:0],
    select_line2[4:0],
    read_data2[31:0]
    );

    always @(*) 
    begin
        if (read_sel == 1)
        begin
            reg_data1 <= read_data1;
            reg_data2 <= read_data2;            
        end
    end

    integer i;
    always @(posedge clk) 
    begin
        if (write_sel == 1)
        begin
           reg_file[write_select_line] = write_data;
        end
        // $display ($time, " reg0= %d,\nreg1= %d,\nreg2= %d,\nreg3= %d,\nreg4= %d,\nreg5= %d,\nreg6= %d,\nreg7= %d,\nreg8= %d,\nreg9= %d,\nreg10= %d,\nreg11= %d,\nreg12= %d,\nreg13= %d,\nreg14= %d,\nreg15= %d,\nreg16= %d,\nreg17= %d,\nreg18= %d,\nreg19= %d,\nreg20= %d,\nreg21= %d,\nreg22= %d,\nreg23= %d,\nreg24= %d,\nreg25= %d,\nreg26= %d,\nreg27= %d,\nreg28= %d,\nreg29= %d,\nreg30= %d,\nreg31= %d",  reg_file[0], reg_file[1], reg_file[2], reg_file[3], reg_file[4], reg_file[5], reg_file[6], reg_file[7], reg_file[8], reg_file[9], reg_file[10], reg_file[11], reg_file[12], reg_file[13], reg_file[14], reg_file[15], reg_file[16], reg_file[17], reg_file[18], reg_file[19], reg_file[20], reg_file[21], reg_file[22], reg_file[23], reg_file[24], reg_file[25], reg_file[26], reg_file[27], reg_file[28], reg_file[29], reg_file[30], reg_file[31] );

    end

endmodule


module mux32_1(
    input in0, in1, in2, in3, in4, in5, in6, in7, in8, in9,
    in10, in11, in12, in13, in14, in15, in16, in17, in18, in19,
    in20, in21, in22, in23, in24, in25, in26, in27, in28, in29,
    in30, in31,
    input [4:0] sel_line,
    output out
);

    wire [15:0] level5;
    wire [7:0] level4;
    wire [3:0] level3;
    wire [1:0] level2;
    mux mux_level5 [15:0] (
        {in15, in14, in13, in12, in11, in10, in9, in8, in7, in6, in5, in4, in3, in2, in1, in0},
        {in31, in30, in29, in28, in27, in26, in25, in24, in23, in22, in21, in20, in19, in18, in17, in16},
        sel_line[4],
        level5[15:0]
    );
    mux mux_level4 [7:0] (level5[7:0], level5[15:8], sel_line[3], level4[7:0]);
    mux mux_level3 [3:0] (level4[3:0], level4[7:4], sel_line[2], level3[3:0]);
    mux mux_level2 [1:0] (level3[1:0], level3[3:2], sel_line[1], level2[1:0]);
    mux mux_level1 (level2[0], level2[1], sel_line[0], out);
    
endmodule

module mux(
    input in0,
    input in1,
    input sel,
    output reg out
);

    always @(*) 
    begin
        case (sel)
            1'b0: out <= in0;
            1'b1: out <= in1;
            default: out <= 1'bx;
        endcase    
    end

endmodule