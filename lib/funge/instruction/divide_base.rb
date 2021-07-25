module Funge
  module Instruction
    class DivideBase < BinaryOperationBase
      protected

      def call(a, b, ip, state)
        b == 0 ? 0 : super
      end
    end
  end
end