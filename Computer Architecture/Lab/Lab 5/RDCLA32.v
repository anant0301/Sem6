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
    assign level3a[7:0] = level2a[7:0];
    assign level3b[7:0] = level2b[7:0];
    assign level4a[15:0] = level3a[15:0];
    assign level4b[15:0] = level3b[15:0];

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
    end
    always @(posedge clk) begin
        sum <= a ^ b ^ level4a[31:0];
        cout <= level4b[32];	
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

