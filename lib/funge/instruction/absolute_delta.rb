module Funge
  module Instruction
    # Sets the instruction pointer's delta to a vector popped off the stack, plus the storage offset
    class AbsoluteDelta < Base
      CHARACTERS = 'x'.freeze

      def execute(ip, state)
        ip.delta = ip.toss.pop_vector(state.dimensions) + ip.storage_offset
      end
    end
  end
end