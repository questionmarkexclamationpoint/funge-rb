module Funge
  module Instruction
    class Remainder < DivideBase
      CHARACTERS = '%'.freeze
    end
  end
end