module Funge
  module Instruction
    # Pops a cell of the stack
    class Pop < Base
      CHARACTERS = '$'.freeze

      def execute(ip, state)
        ip.toss.pop
      end
    end
  end
end