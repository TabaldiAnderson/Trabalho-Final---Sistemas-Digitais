`include "multiplexador.v"

module testbench;

    reg [15:0] A = 16'b0000000000000000;
    reg [15:0] B = 16'b0000000000000001;
    reg [15:0] C = 16'b0000000000000010;
    reg [15:0] D = 16'b0000000000000011;
    reg clk = 0;
    reg sel0 = 0; 
    reg sel1 = 0;
    
    wire [15:0] saida;

    multiplexador m1(A, B, C, D, sel0, sel1, saida);

    always #1 clk <= ~clk;
    initial begin
        $dumpvars;
        #2;
        sel0 <= 0;
        sel1 <= 0;
        #2;
        sel0 <= 1;
        sel1 <= 0;
        #2;
        sel0 <= 0;
        sel1 <= 1;
        #2;
        sel0 <= 1;
        sel1 <= 1;
        #2;
        sel0 <= 1;
        sel1 <= 0;
        $finish;
    end
endmodule