module Funge
  module Instruction
    # Pops a cell n off the stack then prints the character with code point n to stderr.
    class OutputCharacter < Base
      CHARACTERS = ','.freeze

      def execute(ip, state)
        print ip.toss.pop.chr
      end
    end
  end
end