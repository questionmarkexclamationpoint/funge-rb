module Funge
  module Instruction
    # Adds the top two items on the stack and pushes the result onto the stack
    class Add < BinaryOperationBase
      CHARACTERS = '+'.freeze
    end
  end
end