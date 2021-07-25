module Funge
  module Instruction
    # Pops two cells b and a off the stack then pushes the result of a - b onto the stack
    class Subtract < BinaryOperationBase
      CHARACTERS = '-'.freeze
    end
  end
end