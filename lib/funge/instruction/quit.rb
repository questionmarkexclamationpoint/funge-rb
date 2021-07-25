module Funge
  module Instruction
    # Pops a cell n off the stack then immediately ends the program with n as the exit code
    class Quit < Base
      CHARACTERS = 'q'.freeze

      def execute(ip, state)
        exit ip.toss.pop
      end
    end
  end
end