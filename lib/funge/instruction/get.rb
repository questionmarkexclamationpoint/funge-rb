module Funge
  module Instruction
    class Get < Base
      CHARACTERS = 'g'.freeze

      def execute(ip, state)
        vec = ip.toss.pop_vector(state.dimensions) + ip.storage_offset
        ip.toss << state[vec].ord
      end
    end
  end
end