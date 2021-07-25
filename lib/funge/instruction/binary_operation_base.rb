module Funge
  module Instruction
    class BinaryOperationBase < Base
      def initialize(char)
        @method = char.to_sym
      end

      # Performs a binary operation as defined by the instruction character on the first two elements of the stack. The
      # first element on the stack is used as the second operand, and the second element as the first operand, of the
      # operation.
      #
      # @param ip [InstructionPointer] the instruction pointer that is calling this
      # @param state [State] the current state of the Funge program
      def execute(ip, state)
        b, a = ip.toss.pop(2)
        ip.toss.push(*Array(call(a, b, ip, state)))
      end

      protected

      def call(a, b, ip, state)
        a.send(@method, b)
      end
    end
  end
end