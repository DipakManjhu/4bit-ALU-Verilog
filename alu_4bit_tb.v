`timescale 1ns/1ps

module alu_4bit_tb;

  reg [3:0] A, B;
  reg [2:0] opcode;
  wire [3:0] result;
  wire carry;

  alu_4bit uut(.A(A), .B(B), .opcode(opcode), .result(result), .carry(carry));

  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, alu_4bit_tb);

    A = 4'd5; B = 4'd3;

    opcode = 3'b000; #10;
    $display("ADD: %0d + %0d = %0d, carry = %0b", A, B, result, carry);

    opcode = 3'b001; #10;
    $display("SUB: %0d - %0d = %0d", A, B, result);

    opcode = 3'b010; #10;
    $display("AND: %0d & %0d = %0d", A, B, result);

    opcode = 3'b011; #10;
    $display("OR: %0d | %0d = %0d", A, B, result);

    opcode = 3'b100; #10;
    $display("XOR: %0d ^ %0d = %0d", A, B, result);

    opcode = 3'b101; #10;
    $display("NOT A: ~%0d = %0d", A, result);

    // carry test
    A = 4'd15; B = 4'd3;
    opcode = 3'b000; #10;
    $display("ADD overflow: %0d + %0d = %0d, carry = %0b", A, B, result, carry);

    $finish;
  end

endmodule
