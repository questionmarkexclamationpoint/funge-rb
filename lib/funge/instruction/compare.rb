module Funge
  module Instruction
    # Pops two items off the stack, b and a. Turns right if a > b, left if a < b, otherwise does nothing.
    class Compare < Base
      CHARACTERS = 'w'.freeze

      def execute(ip, state)
        b, a = ip.toss.pop(2)
        ip.turn(a <=> b)
      end
    end
  end
end