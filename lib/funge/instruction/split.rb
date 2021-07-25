module Funge
  module Instruction
    class Split < Base
      CHARACTERS = 't'.freeze

      def execute(ip, state)
        copy = ip.deep_dup
        copy.delta = copy.delta * -1
        state.instruction_pointers.unshift(copy)
      end
    end
  end
end