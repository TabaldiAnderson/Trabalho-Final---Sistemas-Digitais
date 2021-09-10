`include "ula.v"

module testbench;

    reg [15:0] A = 16'b0000000000000010;
    reg [15:0] B = 16'b0000000000000011;
    reg clk = 0;
    reg sel = 0;

    wire [15:0] saida;

    ula u1(A, B, sel, saida);

    always #1 clk <= ~clk;
    initial begin
        $dumpvars;
        #3;
        sel <= 1;
        #3;
        sel <= 0;
        #2;
        A <= 16'b0000000000000100;
        B <= 16'b0000000000000010;
        #3;
        sel <= 1;
        #3
        $finish;
    end
endmodule