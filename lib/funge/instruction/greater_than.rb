module Funge
  module Instruction
    class GreaterThan < BinaryOperationBase
      CHARACTERS = '`'.freeze

      protected

      def call(a, b, ip, state)
        ip.toss << (a > b ? 1 : 0)
      end
    end
  end
end