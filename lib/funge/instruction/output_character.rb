module Funge
  module Instruction
    class OutputCharacter < Base
      CHARACTERS = ','.freeze

      def execute(ip, state)
        print ip.toss.pop.chr
      end
    end
  end
end