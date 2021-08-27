`include "registrador.v"

module testbench;

    reg [15:0] entrada = 16'b0000000000000000;
    reg clk = 0; 
    reg load = 0;
    
    wire [15:0] saida;

    registrador r1(entrada, clk, load, saida);
    initial begin
        $dumpvars;

        entrada <= 0;
        load <= 0;
        #5;
        clk <= 1;
        #5;
        entrada <= 1;
        load <= 1;
        clk <= 0;
        #5;
        entrada <= 1;
        load <= 1;
        #5;
        clk <= 1;
        #5;
        entrada <= 0;
        load <= 0;

        $finish;
    end
endmodule