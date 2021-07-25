module Funge
  module Instruction
    class Fingerprint < Base
      CHARACTERS = ('A'..'Z').to_a.freeze

      def execute(ip, state)
        raise NotImplementedError.new("#{Fingerprint} is not implemented")
      end
    end
  end
end