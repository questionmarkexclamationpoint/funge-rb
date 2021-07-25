module Funge
  module Instruction
    class StoreCharacter < Base
      CHARACTERS = 's'.freeze

      def execute(ip, state)
        ip.advance(state)
        state[ip.pos] = (ip.toss.pop).chr
        ip.retreat(state)
      end
    end
  end
end