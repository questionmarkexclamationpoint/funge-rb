module Funge
  module Instruction
    # Pops a cell, n, off the stack. Pops a vector off the stack and assigns it to the storage offset. Transfers n
    # elements off the stack, pops the stack off the stack stack, then pushes those elements onto the new stack.
    class EndBlock < Base
      CHARACTERS =  '}'.freeze

      # @param ip [InstructionPointer]
      # @param state [State]
      def execute(ip, state)
        return reflect(ip) if ip.soss.nil? < 2

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