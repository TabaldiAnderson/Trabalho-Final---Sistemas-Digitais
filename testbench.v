`include "registrador.v"

module testben;

    reg entrada = 0, clk = 0, load = 0;

    registrador r1(entrada, clk, load, saida);

    initial begin
        $dumpvars;

        entrada <= 1;
        load <= 1;
        #5;
        clk <= 1;
        #5;
        entrada <=0;
        load <= 0;
        #5;
        clk <= 1;
        #5;
        entrada <= 1;
        load <= 1;
        #5;
        clock <= 1;

        $finish;
    end

endmodule