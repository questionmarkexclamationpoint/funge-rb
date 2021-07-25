module Funge
  module Instruction
    # Pops a vector V and a number n off the stack, then places n in funge space at location V
    class Put < Base
      CHARACTERS = 'p'.freeze

      def execute(ip, state)
        vec = ip.toss.pop_vector(state.dimensions) + ip.storage_offset
        val = ip.toss.pop
        state[vec] = val.chr
      end
    end
  end
end