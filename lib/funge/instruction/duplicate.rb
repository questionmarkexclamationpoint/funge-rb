module Funge
  module Instruction
    # Pushes the current topmost element of the stack onto the stack
    class Duplicate < Base
      CHARACTERS = ':'.freeze

      def execute(ip, state)
        val = ip.toss.pop
        ip.toss << val << val
      end
    end
  end
end