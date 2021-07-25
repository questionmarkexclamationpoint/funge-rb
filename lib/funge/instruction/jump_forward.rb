module Funge
  module Instruction
    # Pops a cell n off the stack then jumps forward that many spaces
    class JumpForward < Base
      CHARACTERS = 'j'.freeze

      def execute(ip, state)
        ip.pos = ip.pos + ip.delta * ip.toss.pop
      end
    end
  end
end