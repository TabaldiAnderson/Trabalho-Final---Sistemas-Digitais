`include "registrador.v"
`include "multiplexador.v"
`include "ula.v"

module blocoOperativo (
    input [15:0] A,
    input [15:0] B,
    input [15:0] C,
    input [7:0] K,
    input LX,
    input LH,
    input LS,
    input [1:0] M0,
    input [1:0] M1, 
    input [1:0] M2,
    input H, 
    input clk,
    output [15:0] resultado
);
    wire [15:0] entrada00Mux0;
    wire [15:0] entradaX;
    wire [15:0] saidaMux0;
    wire [15:0] saidaMux1;
    wire [15:0] saidaMux2;
    wire [15:0] saidaUla;
    wire [15:0] saidaRegX;
    wire [15:0] saidaRegS;
    wire [15:0] saidaRegH;

    assign entradaX = K;
    assign entrada00Mux0 = 0;

    multiplexador m0(entradaX, A, B, C, M0, saidaMux0);
    multiplexador m1(saidaMux0, saidaRegX, saidaRegS, saidaRegH, M1, saidaMux1);
    multiplexador m2(saidaRegX, saidaMux0, saidaRegS, saidaRegH, M2, saidaMux2);

    ula ula1(saidaMux2, saidaMux1, H, saidaUla);

    registrador regX(entradaX, clk, LX, saidaRegX);
    registrador regS(saidaUla, clk, LS, saidaRegS);
    registrador regH(saidaUla, clk, LH, saidaRegH);

    assign resultado = saidaRegS;

    
endmodule