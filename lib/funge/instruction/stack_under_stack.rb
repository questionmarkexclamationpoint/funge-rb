module Funge
  module Instruction
    # Pops a cell, n, from the stack and transfers n elements from the second-highest stack onto the stack in reverse
    # order. If the stack stack is too small, acts as a reflect.
    class StackUnderStack < Base
      CHARACTERS = 'u'.freeze

      def execute(ip, state)
        return reflect(ip) if ip.soss.nil?

        ip.toss.pop.abs.times do
          ip.toss.push(ip.soss.pop)
        end
      end
    end
  end
end