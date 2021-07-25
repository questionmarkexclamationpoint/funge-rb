module Funge
  module Instruction
    class Duplicate < Base
      CHARACTERS = ':'.freeze

      def execute(ip, state)
        val = ip.toss.pop
        ip.toss << val << val
      end
    end
  end
end