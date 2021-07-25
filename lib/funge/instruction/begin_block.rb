module Funge
  module Instruction
    # Pops one cell, n, off the stack, then pushes a new stack onto the stack stack, and transfers n elements from the
    # previous stack to the current stack, preserving the order of the elements.
    class BeginBlock < Base
      CHARACTERS = '{'.freeze

      # @param ip [InstructionPointer]
      # @param state [State]
      def execute(ip, state)
        soss = ip.toss
        n = soss.pop
        toss = n < 0 ? Array.new(-n, 0) : ip.toss.pop(n)
        ip.stack_stack.unshift(toss)
        soss << ip.storage_offset.z if state.three_dimensions?
        soss << ip.storage_offset.y if state.two_dimensions?
        soss << ip.storage_offset.x
        ip.storage_offset = ip.pos + ip.delta
      end
    end
  end
end