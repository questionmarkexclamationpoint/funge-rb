module Funge
  module Instruction
    # Pops two cells off the stack, b and a. If a is greater than b, pushes 1 onto the stack, otherwise pushes 0.
    class GreaterThan < BinaryOperationBase
      CHARACTERS = '`'.freeze

      protected

      def call(a, b, ip, state)
        ip.toss << (a > b ? 1 : 0)
      end
    end
  end
end