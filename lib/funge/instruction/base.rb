module Funge
  module Instruction
    # A Funge98 instruction. Instructions with significantly similar operations may be combined into the same subclass.
    class Base
      def initialize(char)
      end

      # Subclasses should implement this function. Executes the given instruction.
      def execute(ip, state)
        raise NotImplementedError.new
      end
    end
  end
end