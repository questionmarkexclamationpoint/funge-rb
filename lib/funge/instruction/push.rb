module Funge
  module Instruction
    # Pushes the given base 16 digit onto the stack
    class Push < Base
      CHARACTERS = (('0'..'9').to_a + ('a'..'f').to_a).freeze

      def initialize(char)
        @val = char.to_i(16)
      end

      def execute(ip, state)
        ip.toss << @val
      end
    end
  end
end