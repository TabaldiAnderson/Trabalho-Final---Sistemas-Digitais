module BlocoControle (
    input inicio,
    input clk,
    input rst,
    output [1:0] M0,
    output [1:0] M0,
    output [1:0] M0,
    output LX,
    output LH, 
    output LS,
    output H,
    output pronto
);

    reg [3:0] estado;

    always @(posedge clk || reset) begin
        if (rst)
            estado <= 0;
        else begin
            if (estado == 0 && inicio == 0)
                estado <= estado;
            else begin
                if (pronto)
                    estado <= estado;
                else if (estado == 8) begin
                    estado <= 0;
                end else begin
                    estado <= estado + 1;
                end
            end
        end
    end

    assign LS = estado == 4 ? 1 : estado == 6 ? 1 : estado == 7 ? 1 : 0;
    assign LX = estado == 1 ? 1 : 0;
    assign LH = estado == 3 ? 1 : estado == 5 ? 1 : 0;
    assign H = estado == 1 ? 1 : estado == 2 ? 1 : estado == 3 ? 1 : estado == 4 ? 1 : estado == 5 ? 1 : 0;
    assign M0 = estado == 4 ? 1 : estado == 5 ? 2 : estado == 6 ? 3 : estado == 7 ? 3 : 0;
    assign M1 = estado == 1 ? 1 : estado == 2 ? 1 : estado == 3 ? 1 : estado == 5 ? 1 : estado == 4 ? 2 : estado == 6 ? 2 : 0;  
    assign M2 = estado == 4 ? 1 : estado == 6 ? 2 : estado == 7 ? 2 : 0;
    assign pronto = estado == 8 ? 1 : 0;

endmodule