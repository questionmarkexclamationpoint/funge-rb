module Funge
  module Instruction
    class InputInteger < Base
      CHARACTERS = '&'.freeze

      def execute(ip, state)
        ip.toss << gets.to_i
      end
    end
  end
end