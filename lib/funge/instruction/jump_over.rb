module Funge
  module Instruction
    # Turns on comment mode for the instruction pointer. No subsequent instructions will be executed until another ; is
    # encountered.
    class JumpOver < Base
      CHARACTERS = ';'.freeze

      def execute(ip, state)
        ip.comment_mode = ! ip.comment_mode
      end
    end
  end
end