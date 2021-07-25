module Funge
  module Instruction
    class Put < Base
      CHARACTERS = 'p'.freeze

      def execute(ip, state)
        vec = state.pop_vector(state.dimensions) + ip.storage_offset
        val = ip.toss.pop
        state[vec] = val
      end
    end
  end
end