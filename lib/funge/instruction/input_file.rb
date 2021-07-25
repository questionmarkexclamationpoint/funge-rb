module Funge
  module Instruction
    # Pops a 0-terminated string s from the stack, then a flags cell f, then a vector V. If a file at location s can be
    # opened for reading, it is loaded into funge space at location V. If the least significant bit of f is high, treats
    # the file as binary and inserts new lines and carriage returns as characters rather than wrapping. If the file
    # cannot be opened, acts like reflect.
    class InputFile < Base
      CHARACTERS = 'i'.freeze

      def execute(ip, state)
        filename = ip.toss.pop_string
        binary_mode = ip.toss.pop & 1 == 1
        least_point = ip.toss.pop_vector(state.dimensions) + ip.storage_offset
        begin
          file = File.read(filename)
        rescue
          ip.delta *= -1
          return
        end
        fungified = binary_mode ? [[file.chars]] : Funge.parse(file)
        most_point = least_point + Vector.new(fungified.first.first.size, fungified.first.size, fungified.size)
        least_point.upto(most_point) do |mid_point|
          state[mid_point] = fungified[mid_point.z - least_point.z][mid_point.y - least_point.y][mid_point.x - least_point.x]
        end
      end
    end
  end
end