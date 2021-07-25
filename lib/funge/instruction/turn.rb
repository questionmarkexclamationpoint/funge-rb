module Funge
  module Instruction
    # Rotates the instruction pointer 90 degrees. If [, rotates the delta left on the Z-plane. If ], rotates the delta
    # right on the Z-plane.
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