module Funge
  module Instruction
    # Advances the instruction pointer one step, then pushes the ordinal value of the character at current location of
    # the instruction pointer onto the stack.
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