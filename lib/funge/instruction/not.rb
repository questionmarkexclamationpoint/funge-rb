module Funge
  module Instruction
    # Inverts the value on the top of the stack. If the top of the stack is a 0, replaces it with a 1, otherwise
    # replaces it with a 0.
    class Not < Base
      CHARACTERS = '!'.freeze

      def execute(ip, state)
        ip.toss << (ip.toss.pop == 0 ? 1 : 0)
      end
    end
  end
end