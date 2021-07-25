module Funge
  module Instruction
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