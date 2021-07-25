module Funge
  module Instruction
    class Swap < BinaryOperationBase
      CHARACTERS = '\\'.freeze

      protected

      def call(a, b, ip, state)
        [b, a]
      end
    end
  end
end