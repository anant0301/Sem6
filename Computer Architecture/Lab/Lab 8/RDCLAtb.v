module RDCLAtb;
	reg [7:0]in1;
	reg [7:0]in2;
	reg cin;
	reg clk;
	output cout;
	output [7:0]sum;

	RDCLA8 block_1(in1, in2, cin, clk, cout, sum);
	initial begin
		forever 
		begin
			#1 
			clk = ~clk;
		end
	end

	initial 
	begin
		clk = 1'b1;
		in1 = 33;
		cin = 0;
		in2 = 12;
		#14
		in1 = 3;
		cin = 0;
		in2 = 12;
		#14
		in1 = 13;
		cin = 0;
		in2 = 12;
		#14
		in1 = 137;
		cin = 0;
		in2 = 133;
		#14
		in1 = 14;
		cin = 1;
		in2 = ~127;
		#14
		$finish;
		
	end

	initial 
	begin
		$monitor($time, " in1= %d, in2= %d, sum= %d cout= %d", in1, in2, sum, cout);
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
        reglevel0a <= level0a;
        reglevel0b <= level0b;
        // $display ($time, " level0 a= %d, b= %d", level0a, level0b);
        reglevel1a <= level1a;
        reglevel1b <= level1b; 
        // $display ($time, " level1 a= %d, b= %d", level1a, level1b);
        reglevel2a <= level2a;
        reglevel2b <= level2b;
        // $display ($time, " level2 a= %d, b= %d", level2a, level2b);
    end
    always @(posedge clk) begin
        sum <= a ^ b ^ level2a[7:0];
        cout <= level2b[8];	
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