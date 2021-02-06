module mem_cache (
    input read,
    input write,
    input clk,
    input [15:0] addr,
    input [31:0] writeData,
    output reg [31:0] readData
);

    integer RAM[65536 - 1: 0];
    integer data[16384 - 1:0];
    reg [1:0] addresses [16384 - 1:0];
    reg valid_bit [16384 - 1:0];
    reg dirty_bit [16384 - 1:0];
    integer i;
    reg [3:0] replacement [1023:0];
    reg readComp;

    initial begin
        for (i = 0; i < 1024; ++i) 
        begin
            replacement[i] <= 1'b0;
        end
        for (i = 0; i < 16384; ++i)
        begin
            valid_bit[i] = 1'b0;
        end
        for (i = 0; i < 65536; ++i)
        begin
            RAM[i] = i;
        end
        readComp <= 1'b0;
    end

    always @(posedge clk) 
    begin
        if (read == 1'b1)
        begin
            // read the data
            for (i = addr[3:0]; i < 16384 ; i += 1024) begin
                if (addresses[i] == addr[15:14])
                begin
                    readComp <= 1'b1;
                    readData <= data[i];
                end
            end
            if (readComp == 1'b1)
            begin
                // cache hit
                $display ($time, " Cache hit: %h", addr);
                readComp = 1'b0;
            end
            else
            begin
                // cache miss -- load from memory to readData and cache
                $display ($time, " Cache miss: %h", addr);
                readData <= RAM[addr];
                // replacement in a round robin fashion
                data[{addr[13:4], replacement[addr[13:4]]}] <= RAM[addr];
                addresses[{addr[13:4], replacement[addr[13:4]]}] <= addr[15:14];
                valid_bit[{addr[13:4], replacement[addr[13:4]]}] <= 1'b1;
                dirty_bit[{addr[13:4], replacement[addr[13:4]]}] <= 1'b0;
                replacement[addr[13:4]] = (replacement[addr[13:4]] + 1) % 16;
                readComp = 1'b0;
            end
        end
        else if (write == 1'b1)
        begin
            // write the read the data
            $display ($time, " Data Writing: %h", writeData);
            data[{addr[13:4], replacement[addr[13:4]]}] <= writeData;
            addresses[{addr[13:4], replacement[addr[13:4]]}] <= addr[15:14];
            valid_bit[{addr[13:4], replacement[addr[13:4]]}] <= 1'b0;
            dirty_bit[{addr[13:4], replacement[addr[13:4]]}] <= 1'b0;
            RAM[addr] <= writeData;
            replacement[addr[13:4]] = (replacement[addr[13:4]] + 1) % 16;
        end
    end
endmodule