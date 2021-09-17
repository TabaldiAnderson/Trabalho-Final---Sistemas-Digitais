`include "projetoFinal.v"

module testbench;

    parameter [15:0] A = 5;  //3
    parameter [15:0] B = 3; //4
    parameter [15:0] C = 9;  //6
    parameter [7:0] K = 4; //8

    reg clk = 0;
    reg rst = 0;
    reg inicio = 0;

    wire [15:0] resultado;
    wire pronto;

    projetoFinal proj(A, B, C, K, inicio, clk, rst, pronto, resultado);

    always #1 begin
        clk <= ~clk;
    end

    initial begin
        $dumpvars;
        rst <= 1;
        #1;
        rst <= 0;
        inicio <= 1;
        #30;
        $finish;
    end
endmodule