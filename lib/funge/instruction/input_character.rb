module Funge
  module Instruction
    class InputCharacter < Base
      CHARACTERS = '~'.freeze

      def execute(ip, state)
        ip.toss << gets[0]
      end
    end
  end
end