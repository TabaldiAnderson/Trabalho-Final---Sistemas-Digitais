module registrador (

    input entrada,
    input clk,
    input load,
    output saida
);

    always @( posedge clk ) begin
        if (load == 1) begin
           assign saida <= entrada
        end
    end

endmodule