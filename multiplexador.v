module multiplexador ( 

    input [15:0] A, 
    input [15:0] B, 
    input [15:0] C, 
    input [15:0] D, 
    input sel0, sel1,
    output [15:0] saida
);

    assign saida = sel1 ? (sel0 ? D : C) : (sel0 ? B : A); 

endmodule