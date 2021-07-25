module Funge
  module Instruction
    class AbsoluteDelta < Base
      CHARACTERS = 'x'.freeze

      def execute(ip, state)
        ip.delta = ip.toss.pop_vector(state.dimensions) + ip.storage_offset
      end
    end
  end
end