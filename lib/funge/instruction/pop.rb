module Funge
  module Instruction
    class Pop < Base
      CHARACTERS = '$'.freeze

      def execute(ip, state)
        ip.toss.pop
      end
    end
  end
end