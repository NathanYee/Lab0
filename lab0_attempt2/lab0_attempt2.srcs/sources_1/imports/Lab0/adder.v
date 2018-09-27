// Adder circuit
`define AND and #50
`define OR or #50
`define XOR xor #50
`define NOT not #50

module structuralFullAdder
(
    output sum,
    output carryout,
    input a,
    input b,
    input carryin

);
    wire xor0, and0, and1;
    // Single bit adder with carryin / carryout
    `XOR xor0gate(xor0,a,b);
    `AND and0gate(and0,a,b);
    `XOR sumgate(sum,xor0,carryin);
    `AND and1gate(and1,xor0,carryin);
    `OR orgate(carryout,and0,and1);
endmodule

module FullAdder4bit
(
  output[3:0] sum,  // 2's complement sum of a and b
  output carryout,  // Carry out of the summation of a and b
  output overflow,  // True if the calculation resulted in an overflow
  input[3:0] a,     // First operand in 2's complement format
  input[3:0] b      // Second operand in 2's complement format
);
    // Your Code Here
    wire carryout0, carryout1, carryout2;
    structuralFullAdder adder0 (sum[0], carryout0, a[0], b[0], 0);
    structuralFullAdder adder1 (sum[1], carryout1, a[1], b[1], carryout0);
    structuralFullAdder adder2 (sum[2], carryout2, a[2], b[2], carryout1);
    structuralFullAdder adder3 (sum[3], carryout,  a[3], b[3], carryout2);
    
    wire negand, posand, a3inv, b3inv, s3inv;
    `NOT a3inv(a3inv, a[3]);
    `NOT b3inv(b3inv, b[3]);
    `NOT s3inv(s3inv, sum[3]);
    `AND posand(posand, a3inv, b3inv, carryout2);
    `AND negand(negand, a[3], b[3], s3inv);
    `OR overflowgate(overflow, posand, negand);

endmodule