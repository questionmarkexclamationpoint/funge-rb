module Funge
  module Instruction
    class Reflect < Base
      CHARACTERS = 'r'.freeze

      def execute(ip, state)
        reflect(ip)
      end
    end
  end
end