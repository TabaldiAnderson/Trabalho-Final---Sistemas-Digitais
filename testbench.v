`include "projetoFinal.v"

module testbench;

    reg [15:0] A = 3;//16'b0000000000000011; //3
    reg [15:0] B = 4;//16'b0000000000000100; //4
    reg [15:0] C = 6;//16'b0000000000000110; //6
    reg [7:0] K = 8;//8'b00001000;  //8
    reg clk = 0;
    reg rst = 0;
    reg inicio = 0;
    wire pronto;
    wire [15:0] resultado;

    projetoFinal projeto1(A, B, C, K, inicio, clk, rst, pronto, resultado);

    always #1 clk <= ~clk;         

    initial begin
        $dumpvars;
        rst <= 1;
        #1;
        rst <= 0;
        inicio <= 1;
        #10;
        $finish;
    end
endmodule