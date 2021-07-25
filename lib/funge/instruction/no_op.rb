module Funge
  module Instruction
    # A no-operation. Nothing is executed.
    class NoOp < Base
      CHARACTERS = [' ', 'z'].freeze

      def execute(ip, state)
      end
    end
  end
end