module Funge
  module Instruction
    # Empties the current stack
    class ClearStack < Base
      CHARACTERS = 'n'.freeze

      def execute(ip, state)
        ip.toss.clear
      end
    end
  end
end