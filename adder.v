// Adder circuit
`define AND and #50
`define OR or #50
`define XOR xor #50
`define NOT not #50

module behavioralFullAdder
(
    output sum,
    output carryout,
    input a,
    input b,
    input carryin
);
    // Uses concatenation operator and built-in '+'
    assign {carryout, sum}=a+b+carryin;
endmodule

module structuralFullAdder
(
    output sum,
    output carryout,
    input a,
    input b,
    input carryin

);
    wire xor0, and0, and1;
    // My decoder code here
    `XOR xorgate(xor0,a,b);
    `AND andgate(and0,a,b);
    `XOR xorgate(sum,xor0,carryin);
    `AND andgate(and1,xor0,carryin);
    `OR orgate(carryout,and0,and1);



endmodule
