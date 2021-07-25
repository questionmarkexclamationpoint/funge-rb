module Funge
  module Instruction
    # Gets a single character from stdin, then pushes the ordinal of that character onto the stack.
    class InputCharacter < Base
      CHARACTERS = '~'.freeze

      def execute(ip, state)
        ip.toss << STDIN.gets[0].ord
      end
    end
  end
end