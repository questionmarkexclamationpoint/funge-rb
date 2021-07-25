module Funge
  module Instruction
    class StackUnderStack < Base
      CHARACTERS = 'u'.freeze

      def execute(ip, state)
        raise NotImplementedError.new("#{StackUnderStack} is not implemented") # TODO
      end
    end
  end
end