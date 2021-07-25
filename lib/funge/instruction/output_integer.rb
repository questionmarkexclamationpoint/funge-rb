module Funge
  module Instruction
    # Pops a cell n off the stack then prints it to stdout
    class OutputInteger < Base
      CHARACTERS = '.'.freeze

      def execute(ip, state)
        print(ip.toss.pop)
      end
    end
  end
end