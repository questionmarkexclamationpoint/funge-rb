module Funge
  module Instruction
    # Stops the current instruction pointer
    class Stop < Base
      CHARACTERS = '@'.freeze

      def execute(ip, state)
        ip.delta = Vector.new
      end
    end
  end
end