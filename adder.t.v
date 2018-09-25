// Adder testbench
`timescale 1 ns / 1 ps
`include "adder.v"

// module testFullAdder();
//     reg a, b, carryin;
//     wire sum, carryout;

//     structuralFullAdder adder (sum, carryout, a, b, carryin); // Swap after testing

//     initial begin
//     $dumpfile("adder.vcd");
//     $dumpvars;

//     $display("a  b in | Out Sum| Expected Output");
//     a = 0;b = 0; carryin = 0; #1000
//     $display("%b  %b  %b |  %b   %b | All False", a, b, carryin, carryout, sum);
//     a = 0;b = 0; carryin = 1; #1000
//     $display("%b  %b  %b |  %b   %b | Sum Only ", a, b, carryin, carryout, sum);
//     a = 1;b = 0; carryin = 0; #1000
//     $display("%b  %b  %b |  %b   %b | Sum Only", a, b, carryin, carryout, sum);
//     a = 1;b = 0; carryin = 1; #1000
//     $display("%b  %b  %b |  %b   %b | Carryout Only ", a, b, carryin, carryout, sum);
//     a = 0;b = 1; carryin = 0; #1000
//     $display("%b  %b  %b |  %b   %b | Sum Only", a, b, carryin, carryout, sum);
//     a = 0;b = 1; carryin = 1; #1000
//     $display("%b  %b  %b |  %b   %b | Carryout Only ", a, b, carryin, carryout, sum);
//     a = 1;b = 1; carryin = 0; #1000
//     $display("%b  %b  %b |  %b   %b | Carryout Only", a, b, carryin, carryout, sum);
//     a = 1;b = 1; carryin = 1; #1000
//     $display("%b  %b  %b |  %b   %b | Both True ", a, b, carryin, carryout, sum);
//     $finish();
//     end
// endmodule

module testFullAdder();
    reg [3:0] a, b;
    wire [3:0] sum;
    wire carryout, overflow;

    FullAdder4bit fulladder (sum, carryout, overflow, a, b);

    initial begin
    $display("a    | b    | sum   cout ovfl | Esum Ecout Eovfl");
    a = 4'b1111; b = 4'b1111; #1000
    $display("%b | %b | %b  %b    %b    | 0000 0     0", a, b, sum, carryout, overflow);
    a = 4'b0001; b = 4'b0010; #1000
    $display("%b | %b | %b  %b    %b    | 0000 0     0", a, b, sum, carryout, overflow);


    // $dumpfile("adder.vcd");
    // $dumpvars;

    // $display("a  b in | Out Sum| Expected Output");
    // a = 0;b = 0; carryin = 0; #1000
    // $display("%b  %b  %b |  %b   %b | All False", a, b, carryin, carryout, sum);
    // a = 0;b = 0; carryin = 1; #1000
    // $display("%b  %b  %b |  %b   %b | Sum Only ", a, b, carryin, carryout, sum);
    // a = 1;b = 0; carryin = 0; #1000
    // $display("%b  %b  %b |  %b   %b | Sum Only", a, b, carryin, carryout, sum);
    // a = 1;b = 0; carryin = 1; #1000
    // $display("%b  %b  %b |  %b   %b | Carryout Only ", a, b, carryin, carryout, sum);
    // a = 0;b = 1; carryin = 0; #1000
    // $display("%b  %b  %b |  %b   %b | Sum Only", a, b, carryin, carryout, sum);
    // a = 0;b = 1; carryin = 1; #1000
    // $display("%b  %b  %b |  %b   %b | Carryout Only ", a, b, carryin, carryout, sum);
    // a = 1;b = 1; carryin = 0; #1000
    // $display("%b  %b  %b |  %b   %b | Carryout Only", a, b, carryin, carryout, sum);
    // a = 1;b = 1; carryin = 1; #1000
    // $display("%b  %b  %b |  %b   %b | Both True ", a, b, carryin, carryout, sum);
    // $finish();
    end
endmodule
