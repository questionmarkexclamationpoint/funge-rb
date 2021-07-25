module Funge
  module Instruction
    class ClearStack < Base
      CHARACTERS = 'n'.freeze

      def execute(ip, state)
        ip.toss.clear
      end
    end
  end
end