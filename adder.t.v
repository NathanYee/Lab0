// Adder testbench
`timescale 1 ns / 1 ps
`include "adder.v"

module testFullAdder();
    reg [3:0] a, b;
    wire [3:0] sum;
    wire carryout, overflow;

    FullAdder4bit fulladder (sum, carryout, overflow, a, b);

    initial begin
    $display("a    | b    | sum   cout ovfl | Esum Ecout Eovfl");
    /*
    Negatives
    
    -2 + -3 = -5 => yes carryout, no overflow
    -1 + -4 = -5 => 

    */
    a = 4'b1110; b = 4'b1101; #1000 // -2 + -3 = -5 
    $display("%b | %b | %b  %b    %b    | 1011 1     0", a, b, sum, carryout, overflow);
    a = 4'b1111; b = 4'b1100; #1000 // -1 + -4 = -5 
    $display("%b | %b | %b  %b    %b    | 1011 1     0", a, b, sum, carryout, overflow);
    a = 4'b1001; b = 4'b1110; #1000 //-7 + -2 = 8
    $display("%b | %b | %b  %b    %b    | 0111 1     1", a, b, sum, carryout, overflow);
    a = 4'b1110; b = 4'b1001; #1000 //-2 + -7 = 8
    $display("%b | %b | %b  %b    %b    | 0111 1     1", a, b, sum, carryout, overflow);

    /*
    Pos/Neg
    */
    a = 4'b0001; b = 4'b1001; #1000 // 1 + -7 = -6
    $display("%b | %b | %b  %b    %b    | 1010 0     0", a, b, sum, carryout, overflow);
    a = 4'b0011; b = 4'b1011; #1000 // 3 + -5 = -2
    $display("%b | %b | %b  %b    %b    | 1110 0     0", a, b, sum, carryout, overflow);  
    a = 4'b0111; b = 4'b1111; #1000 // 7 + -1 = 6
    $display("%b | %b | %b  %b    %b    | 0110 1     0", a, b, sum, carryout, overflow); 
    a = 4'b0011; b = 4'b1101; #1000 // 3 + -3 = 0
    $display("%b | %b | %b  %b    %b    | 0000 1     0", a, b, sum, carryout, overflow);


    /*
    Pos/Pos
    */
    a = 4'b0101; b = 4'b0010; #1000 // 5 + 2 = 7
    $display("%b | %b | %b  %b    %b    | 0111 0     0", a, b, sum, carryout, overflow);
    a = 4'b0001; b = 4'b0010; #1000 // 1 + 2 = 3
    $display("%b | %b | %b  %b    %b    | 0011 0     0", a, b, sum, carryout, overflow);
    a = 4'b0101; b = 4'b0011; #1000 // 5 + 3 = -8 
    $display("%b | %b | %b  %b    %b    | 1000 0     1", a, b, sum, carryout, overflow);
    a = 4'b0111; b = 4'b0001; #1000 // 7 + 1 = -8 
    $display("%b | %b | %b  %b    %b    | 1000 0     1", a, b, sum, carryout, overflow);

    /*
    Corner cases
    */
    a = 4'b0000; b = 4'b0000; #1000 // 0 + 0 = 0
    $display("%b | %b | %b  %b    %b    | 0000 0     0", a, b, sum, carryout, overflow);
    a = 4'b1000; b = 4'b0111; #1000 // -8 + 7 = -1 
    $display("%b | %b | %b  %b    %b    | 1111 0     0", a, b, sum, carryout, overflow);
    a = 4'b1000; b = 4'b1000; #1000 // -8 + -8 = 0 
    $display("%b | %b | %b  %b    %b    | 0000 1     1", a, b, sum, carryout, overflow);
    a = 4'b0111; b = 4'b0111; #1000 // 7 + 7 = -2
    $display("%b | %b | %b  %b    %b    | 1110 0     1", a, b, sum, carryout, overflow);



    // a = 4'b1101; b = 4'b1011; #1000 // -3 + -5 = -8
    // $display("%b | %b | %b  %b    %b    | 1000 1     0", a, b, sum, carryout, overflow);
    // a = 4'b0011; b = 4'b1011; #1000 // +3 + -5 = -2
    // $display("%b | %b | %b  %b    %b    | 1110 0     0", a, b, sum, carryout, overflow);
    // a = 4'b0101; b = 4'b1101; #1000 // +5 + -3 = 2
    // $display("%b | %b | %b  %b    %b    | 0010 1     0", a, b, sum, carryout, overflow);
    
    // a = 4'b0101; b = 4'b1101; #1000 // +5 + -3 = 2
    // $display("%b | %b | %b  %b    %b    | 0010 1     0", a, b, sum, carryout, overflow);
    // a = 4'b0101; b = 4'b1101; #1000 // +5 + -3 = 2
    // $display("%b | %b | %b  %b    %b    | 0010 1     0", a, b, sum, carryout, overflow);
    // a = 4'b0101; b = 4'b1101; #1000 // +5 + -3 = 2
    // $display("%b | %b | %b  %b    %b    | 0010 1     0", a, b, sum, carryout, overflow);
    // a = 4'b0101; b = 4'b1101; #1000 // +5 + -3 = 2
    // $display("%b | %b | %b  %b    %b    | 0010 1     0", a, b, sum, carryout, overflow);
    // a = 4'b0101; b = 4'b1101; #1000 // +5 + -3 = 2
    // $display("%b | %b | %b  %b    %b    | 0010 1     0", a, b, sum, carryout, overflow);
    // a = 4'b0101; b = 4'b1101; #1000 // +5 + -3 = 2
    // $display("%b | %b | %b  %b    %b    | 0010 1     0", a, b, sum, carryout, overflow);
    // a = 4'b0101; b = 4'b1101; #1000 // +5 + -3 = 2
    // $display("%b | %b | %b  %b    %b    | 0010 1     0", a, b, sum, carryout, overflow);
    // a = 4'b0101; b = 4'b1101; #1000 // +5 + -3 = 2
    // $display("%b | %b | %b  %b    %b    | 0010 1     0", a, b, sum, carryout, overflow);
    end
endmodule
