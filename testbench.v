`include "blocoControle.v"

module testbench;

    reg inicio = 0;
    reg clk = 0;
    reg rst = 0;
    //reg [3:0] estado = 4'b0000; 
    wire [1:0] M0;
    wire [1:0] M1; 
    wire [1:0] M2;
    wire LX;
    wire LH;
    wire LS;
    wire H;
    wire pronto;

    blocoControle bloco1(inicio, clk, rst, M0, M1, M2, LX, LH, LS, H, pronto);

    always #1 clk <= ~clk;         

    //always #1 clk <= ~clk;

    initial begin
        $dumpvars;
        rst <= 1;
        #1;
        rst <= 0;
        inicio <= 1;
        #15;
        $finish;
    end
endmodule