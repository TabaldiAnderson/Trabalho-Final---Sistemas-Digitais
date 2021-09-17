module blocoControle (
    input inicio,
    input clk,
    input rst,
    output [1:0] M0,
    output [1:0] M1,
    output [1:0] M2,
    output LX,
    output LH, 
    output LS,
    output H,
    output pronto
);

    reg [3:0] estado;

    always @(posedge clk or rst) begin
        if (rst)
            estado <= 0;
        else begin
            if (estado == 0 && ~inicio)
                estado <= estado;
            else begin
                if (pronto)
                    estado <= estado;
                else if (estado == 8)
                    estado <= 0;
                else 
                    estado <= estado + 1;
            end
        end
    end


/*
    detalhamento antigo
    assign LS = estado == 4 ? 1 : estado == 6 ? 1 : estado == 7 ? 1 : 0;
    assign LX = estado == 1 ? 1 : 0;
    assign LH = estado == 3 ? 1 : estado == 5 ? 1 : 0;
    assign H = estado == 1 ? 1 : estado == 2 ? 1 : estado == 3 ? 1 : estado == 4 ? 1 : estado == 5 ? 1 : 0;
    assign M0 = estado == 4 ? 1 : estado == 5 ? 2 : estado == 7 ? 3 : 0;
    assign M1 = estado == 1 ? 1 : estado == 2 ? 1 : estado == 3 ? 1 : estado == 5 ? 1 : estado == 4 ? 3 : estado == 6 ? 3 : 0;  
    assign M2 = estado == 4 ? 1 : estado == 6 ? 2 : estado == 7 ? 2 : 0;
    assign pronto = estado == 8 ? 1 : 0;
*/
    assign LS = estado == 2 ? 1 : estado == 4 ? 1 : estado == 6 ? 1 : 0;
    assign LX = estado == 1 ? 1 : 0;
    assign LH = estado == 3 ? 1 : estado == 5 ? 1 : 0;
    assign H = estado == 2 ? 1 : estado == 3 ? 1 : estado == 4 ? 1 : 0;
    assign M0 = estado == 3 ? 1 : estado == 4 ? 2 : estado == 6 ? 3 : 0;
    assign M1 = estado == 2 ? 1 : estado == 3 ? 0 : estado == 5 ? 2 : estado == 6 ? 0 : 0;  
    assign M2 = estado == 3 ? 2 : estado == 5 ? 3 : estado == 6 ? 3 : 0;
    assign pronto = estado == 7 ? 1 : 0;
    
endmodule