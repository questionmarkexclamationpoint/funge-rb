module Funge
  module Instruction
    # Pops a vector V and a number n off the stack, then places n in funge space at location V
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