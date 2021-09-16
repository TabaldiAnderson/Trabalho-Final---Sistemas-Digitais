module multiplexador ( 

    input [15:0] A, 
    input [15:0] B, 
    input [15:0] C, 
    input [15:0] D, 
    input [1:0] sel,
    output [15:0] saida
);

    assign saida = sel == 01 ? (sel == 00 ? D : C) : (sel == 00 ? B : A); 

endmodule