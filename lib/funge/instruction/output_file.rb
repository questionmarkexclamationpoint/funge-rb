module Funge
  module Instruction
    # Pops a 0-terminated string s, a flags cell f, a vector Va, and a vector Vb from the stack.
    class OutputFile < Base
      CHARACTERS = 'o'

      def execute(ip, state)
        filename = ip.toss.pop_string
        linear_mode = ip.toss.pop & 1 == 1
        least_point = ip.toss.pop_vector(state.dimensions) + ip.storage_offset
        most_point = ip.toss.pop_vector(state.dimensions) + least_point - Vector.new(1, state.two_dimensions? ? 1 : 0, state.three_dimensions? ? 1 : 0)
        out = []
        least_point.z.upto(most_point.z) do |z|
          page = ''
          least_point.y.upto(most_point.y) do |y|
            line = ''
            least_point.x.upto(most_point.x) do |x|
              line += state[Vector.new(x, y, z)]
            end
            line += $/ if state.two_dimensions?
            line = line.strip if linear_mode
            page += line
          end
          out << page
        end
        begin
          if out.size > 1 && ! linear_mode
            out.each.with_index do |page, i|
              File.write(filename + "/#{i}", page)
            end
          else
            File.write(filename, out.join)
          end
        rescue
          ip.delta *= -1
        end
      end
    end
  end
end