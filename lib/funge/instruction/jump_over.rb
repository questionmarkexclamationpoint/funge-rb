module Funge
  module Instruction
    class JumpOver < Base
      CHARACTERS = ';'.freeze

      def execute(ip, state)
        ip.comment_mode = ! ip.comment_mode
      end
    end
  end
end