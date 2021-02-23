module mem_cache(
    input read, write, clk,
    input [15:0] writeAddr, readAddr,
    input [31:0] writeData,
    output reg [31:0] readData
);

    integer RAM[65536 - 1: 0];
    integer data[16384 - 1:0];
    reg [1:0] addresses [1024 - 1:0];

    integer i, k;
    reg [31:0] temp;

    wire [13:0] cacheLine_addr;
    assign cacheLine_addr[13:0] = {readAddr[13:4], 4'b0};

    initial begin
        for (i = 0; i < 65536; ++i)
        begin
            RAM[i] = i;
        end
    end

    always @(posedge clk)
    begin
        if (read == 1'b1)
        begin
            // read the data
            if (addresses[cacheLine_addr] == readAddr[15:14]) begin
                // cache hit
                $display($time, " Cache Hit Addr: %h", readAddr);
                readData <= data[readAddr[13:0]];
            end
            else begin
                // cache miss
                $display($time, " Cache Miss Addr: %h", readAddr);
                k <= 0;
                addresses[cacheLine_addr][1:0] <= readAddr[15:14];
                for (i = cacheLine_addr; i < cacheLine_addr + 512; i += 32) begin
                    data[cacheLine_addr + k] = RAM[readAddr + k];
                    k += 1;
                end
            end
                    
        end
        if (write == 1'b1)
        begin
            // write the read the data
            $display ($time, " Data Writing Addr: %h", writeAddr);
            data[writeAddr[13:0]] <= writeData;
            RAM[writeAddr] <= writeData;
            addresses[writeAddr[13:4]] <= writeAddr[15:14];
        end
    end
endmodule