`include "blocoControle.v"
`include "blocoOperativo.v"

module projetoFinal (
    
    input [15:0] A,
    input [15:0] B,
    input [15:0] C,
    input [7:0] K,
    input inicio,
    input clk,
    input rst,
    output pronto,
    output [15:0] resultado
);

    wire LX;
    wire LH;
    wire LS;
    wire H;
    wire [1:0] M0;
    wire [1:0] M1;
    wire [1:0] M2;

    blocoControle BC(inicio, clk, rst, M0, M1, M2, LX, LH, LS, H, pronto);
    blocoOperativo BO(A, B, C, K, LX, LH, LS, M0, M1, M2, H, clk, resultado);
    
endmodule