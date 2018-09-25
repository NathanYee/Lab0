// Adder testbench
`timescale 1 ns / 1 ps
`include "adder.v"

module testFullAdder();
    reg a, b, carryin;
    wire sum, carryout, xor0, and0, and1;

    //behavioralFullAdder adder (sum, carryout, a, b, carryin);
    structuralFullAdder adder (sum, carryout, a, b, carryin); // Swap after testing

    initial begin
    $dumpfile("adder.vcd");
    $dumpvars;

    $display("a  b in | Out Sum| Expected Output");
    a = 0;b = 0; carryin = 0; #1000
    $display("%b  %b  %b |  %b   %b | All False", a, b, carryin, carryout, sum);
    a = 0;b = 0; carryin = 1; #1000
    $display("%b  %b  %b |  %b   %b | Sum Only ", a, b, carryin, carryout, sum);
    a = 1;b = 0; carryin = 0; #1000
    $display("%b  %b  %b |  %b   %b | Sum Only", a, b, carryin, carryout, sum);
    a = 1;b = 0; carryin = 1; #1000
    $display("%b  %b  %b |  %b   %b | Carryout Only ", a, b, carryin, carryout, sum);
    a = 0;b = 1; carryin = 0; #1000
    $display("%b  %b  %b |  %b   %b | Sum Only", a, b, carryin, carryout, sum);
    a = 0;b = 1; carryin = 1; #1000
    $display("%b  %b  %b |  %b   %b | Carryout Only ", a, b, carryin, carryout, sum);
    a = 1;b = 1; carryin = 0; #1000
    $display("%b  %b  %b |  %b   %b | Carryout Only", a, b, carryin, carryout, sum);
    a = 1;b = 1; carryin = 1; #1000
    $display("%b  %b  %b |  %b   %b | Both True ", a, b, carryin, carryout, sum);
    $finish();
    end
endmodule
