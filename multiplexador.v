module multiplexador ( 

    input [15:0] A, 
    input [15:0] B, 
    input [15:0] C, 
    input [15:0] D, 
    input [1:0] sel,
    output [15:0] saida
);

    assign saida = sel == 0 ? A : sel == 1 ? B : sel == 2 ? C : sel == 3 ? D : 0;

endmodule