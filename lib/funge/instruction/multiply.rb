module Funge
  module Instruction
    # Pops two cells b and a, then pushes the result of a * b onto the stack.
    class Multiply < BinaryOperationBase
      CHARACTERS = '*'.freeze
    end
  end
end