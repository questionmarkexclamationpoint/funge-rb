module Funge
  module Instruction
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