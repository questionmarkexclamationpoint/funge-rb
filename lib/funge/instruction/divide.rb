module Funge
  module Instruction
    # Pops two cells off the stack, b and a, then pushes the result of a / b onto the stack. Pushes 0 onto the stack if
    # b is 0.
    class Divide < DivideBase
      CHARACTERS = '/'.freeze
    end
  end
end