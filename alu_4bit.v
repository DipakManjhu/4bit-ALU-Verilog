module alu_4bit(A, B, opcode, result, carry);

  input [3:0] A, B;
  input [2:0] opcode;
  output reg [3:0] result;
  output reg carry;

  always @(*) begin
    carry = 0;
    case(opcode)
      3'b000: {carry, result} = A + B;  // addition
      3'b001: {carry, result} = A - B;  // subtraction
      3'b010: result = A & B;           // and
      3'b011: result = A | B;           // or
      3'b100: result = A ^ B;           // xor
      3'b101: result = ~A;              // not
    endcase
  end

endmodule
