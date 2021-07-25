module Funge
  module Instruction
    # Skips the next location
    class Trampoline < Base
      CHARACTERS = '#'.freeze

      def execute(ip, state)
        ip.advance(state)
      end
    end
  end
end