module Funge
  module Instruction
    class Reflect < Base
      CHARACTERS = 'r'.freeze

      def execute(ip, state)
        ip.delta = ip.delta * -1
      end
    end
  end
end