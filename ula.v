module ula (

    input [15:0] A, 
    input [15:0] B, 
    input sel,
    output [15:0] saida
);
    assign saida = sel ? A * B : A + B;

endmodule