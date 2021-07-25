module Funge
  module Instruction
    class EndBlock < Base
      CHARACTERS =  '}'.freeze

      # @param ip [InstructionPointer]
      # @param state [State]
      def execute(ip, state)
        if ip.stack_stack.size <= 2
          ip.delta = ip.delta * -1
          return
        end
        toss = ip.stack_stack.pop
        soss = ip.toss
        n = ip.toss.pop
        ip.storage_offset = ip.toss.pop_vector(state.dimensions)
        soss.pop(n.abs) if n < 0
        soss.push(*toss.pop(n)) if n > 0
      end
    end
  end
end