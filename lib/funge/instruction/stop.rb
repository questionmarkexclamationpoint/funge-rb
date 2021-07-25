module Funge
  module Instruction
    class Stop < Base
      CHARACTERS = '@'.freeze

      def execute(ip, state)
        ip.delta = Vector.new
      end
    end
  end
end