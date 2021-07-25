module Funge
  module Instruction
    class Compare < Base
      CHARACTERS = 'w'.freeze

      def execute(ip, state)
        b, a = ip.toss.pop(2)
        ip.turn(a <=> b)
      end
    end
  end
end