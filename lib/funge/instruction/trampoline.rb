module Funge
  module Instruction
    class Trampoline < Base
      CHARACTERS = '#'.freeze

      def execute(ip, state)
        ip.advance(state)
      end
    end
  end
end