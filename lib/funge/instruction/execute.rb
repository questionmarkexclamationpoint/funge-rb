module Funge
  module Instruction
    # Pops a string off the stack, then executes that string as system code, pushing the exit code of that execution
    # onto the stack.
    class Execute < Base
      CHARACTERS = '='.freeze

      def execute(ip, state)
        system(ip.toss.pop_string)
        ip.toss << $?.exitstatus
      end
    end
  end
end