module Funge
  # A Funge-style stack. Contains helper methods for popping vectors and strings off the stack.
  class Stack < Array

    # Pops n elements off the stack, returning them.
    #
    # @param n [Integer] the number of elements to pop off the stack
    # @return [Integer, Array(Integer)] the first n elements from the stack, in top to bottom order, as an array if
    # n > 1, or as an integer if n == 1
    def pop(n = 1)
      ret = 1.upto(n).map{ super() || 0 }.ljust(n, 0)
      ret = ret.first if n == 1
      ret
    end

    def <<(v)
      push(v)
    end

    def push(v)
      raise ArgumentError.new("Can only push Integers to #{Stack}") unless v.is_a?(Integer)

      super
    end

    # See #pop
    def >>(n)
      pop(n)
    end

    # Pops characters from the stack until a 0 or the end of the stack is reached.
    #
    # @return [String] the first 0-terminated string from the stack
    def pop_string
      string = ''
      i = pop || 0
      until i == 0
        string += i.chr
        i = pop
      end
      string
    end

    # Pops a vector of size 0-3, as determined by the given parameter.
    # @param dimensions [0, 1, 2, 3] the number of dimensions to pop off the stack for the vector
    # @return [Vector] the n-dimension vector from the stack
    def pop_vector(dimensions)
      z, y, x = (dimensions >= 3 ? pop : 0), (dimensions >= 2 ? pop : 0), (dimensions >= 1 ? pop : 0)
      Vector.new(x, y, z)
    end
  end
end