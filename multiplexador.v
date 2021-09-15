module multiplexador ( 

    input [15:0] A, 
    input [15:0] B, 
    input [15:0] C, 
    input [15:0] D, 
    input [1:0] sel,
    output [15:0] saida
);

    assign saida = sel[1] ? (sel[0] ? D : C) : (sel[0] ? B : A); 

endmodule