`include "blocoOperativo.v"

module testbench;

    reg [15:0] A = 16'b0000000000000000;
    reg [15:0] B = 16'b0000000000000000;
    reg [15:0] C = 16'b0000000000000000;
    reg [7:0] K = 8'b00000100;
    reg LX = 0;
    reg LH = 0;
    reg LS = 0;
    reg [1:0] M0 = 2'b00;
    reg [1:0] M1 = 2'b00; 
    reg [1:0] M2 = 2'b00;
    reg H = 0;
    reg clk = 0;
    wire [15:0] resultado;

    blocoOperativo bloco1(A, B, C, K, LX, LH, LS, M0, M1, M2, H, clk, resultado);           

    always #1 clk <= ~clk;

    initial begin
        $dumpvars;
        LX = 1;
        M1 = 01;
        M2 = 00;
        H = 1;
        LS = 0;
        LH = 0;
        #1;
        LX = 0;
        M1 = 01;
        M2 = 00;
        H = 1;
        LS = 0;
        LH = 0;
        #1;
        LX = 0;
        M0 = 0;
        M1 = 01;
        M2 = 00;
        H = 1;
        LS = 0;
        LH = 1;
        #1;
        LX = 0;
        M0 = 01;
        M1 = 11;
        M2 = 01;
        H = 1;
        LS = 1;
        LH = 0;
        #1;
        LX = 0;
        M0 = 10;
        M1 = 01;
        M2 = 00;
        H = 1;
        LS = 0;
        LH = 1;
        #1;
        $finish;
    end
endmodule