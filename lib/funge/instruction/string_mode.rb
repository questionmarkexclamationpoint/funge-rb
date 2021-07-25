module Funge
  module Instruction
    # Toggles string mode for the current instruction pointer. In string mode, subsequent characters are pushed onto
    # the stack, rather than executed, until string mode is disabled.
    class StringMode < Base
      CHARACTERS = '"'.freeze

      def execute(ip, state)
        ip.string_mode = ! ip.string_mode
      end
    end
  end
end