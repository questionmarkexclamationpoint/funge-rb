module Funge
  module Instruction
    class Turn < Base
      CHARACTERS = ['[', ']'].freeze

      def initialize(char)
        if char == '['
          @side = -1
        elsif char == ']'
          @side = 1
        else
          @side = 0
        end
      end

      def execute(ip, state)
        ip.turn(@side)
      end
    end
  end
end