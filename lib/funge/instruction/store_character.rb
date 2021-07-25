module Funge
  module Instruction
    # Pops a character off the stack and places it in the next location
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