module Funge
  module Instruction
    class JumpForward < Base
      CHARACTERS = 'j'.freeze

      def execute(ip, state)
        ip.pos = ip.pos + ip.delta * ip.toss.pop
      end
    end
  end
end