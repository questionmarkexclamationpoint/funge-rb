module Funge
  module Instruction
    # Duplicates the current instruction pointer and adds it to the state's instruction pointer.
    class Split < Base
      CHARACTERS = 't'.freeze

      def execute(ip, state)
        copy = ip.deep_dup
        reverse(copy)
        state.instruction_pointers.unshift(copy)
      end
    end
  end
end