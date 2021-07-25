module Funge
  module Instruction
    # Swaps the two topmost cells on the stack
    class Swap < BinaryOperationBase
      CHARACTERS = '\\'.freeze

      protected

      def call(a, b, ip, state)
        [b, a]
      end
    end
  end
end