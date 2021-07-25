module Funge
  module Instruction
    class FetchCharacter < Base
      CHARACTERS = '\''.freeze

      # @param ip [InstructionPointer]
      # @param state [State]
      def execute(ip, state)
        ip.advance(state)
        ip.toss << state[ip.pos].ord
      end
    end
  end
end