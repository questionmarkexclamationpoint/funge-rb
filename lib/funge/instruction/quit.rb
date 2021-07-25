module Funge
  module Instruction
    class Quit < Base
      CHARACTERS = 'q'.freeze

      def execute(ip, state)
        exit ip.toss.pop
      end
    end
  end
end