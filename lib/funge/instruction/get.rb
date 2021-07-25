module Funge
  module Instruction
    # Pops a vector V off the stack, then pushes the value in funge space at V + the instruction pointer's storage
    # offset onto the stack
    class Get < Base
      CHARACTERS = 'g'.freeze

      def execute(ip, state)
        vec = ip.toss.pop_vector(state.dimensions) + ip.storage_offset
        ip.toss << state[vec].ord
      end
    end
  end
end