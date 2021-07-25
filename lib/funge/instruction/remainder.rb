module Funge
  module Instruction
    # Pops two cells b and a off the stack, then pushes the result of the modulo of a and b (i.e. a % b) onto the stack
    class Remainder < DivideBase
      CHARACTERS = '%'.freeze
    end
  end
end