module Funge
  module Instruction
    class Semantics < Base
      CHARACTERS = ['(', ')'].freeze

      def execute(ip, state)
        raise NotImplementedError.new("#{Semantics} is not implemented")
        v = 0
        ip.toss.pop.times do
          v = v * 256 + ip.toss.pop
        end
      end
    end
  end
end