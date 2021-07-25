module Funge
  module Instruction
    class OutputInteger < Base
      CHARACTERS = '.'.freeze

      def execute(ip, state)
        print(ip.toss.pop)
      end
    end
  end
end