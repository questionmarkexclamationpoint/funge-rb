module Funge
  module Instruction
    # Pops a cell n off the stack, then iterates the next instruction n times in a single tick.
    class Iterate < Base
      CHARACTERS = 'k'.freeze

      def execute(ip, state)
        n = ip.toss.pop
        ip.advance(state)
        n.times do
          ip.curr(state).execute(ip, state)
        end
        ip.retreat(state)
      end
    end
  end
end