module Funge
  module Instruction
    # Gets a single integer from stdin, ignoring non-decimal characters, then pushes it onto the stack.
    class InputInteger < Base
      CHARACTERS = '&'.freeze

      def execute(ip, state)
        input = /\d+/.match(gets)
        ip.toss << input.nil? ? 0 : input[0]
      end
    end
  end
end