module Funge
  class State
    attr_reader :funge_space,
                :pos,
                :delta,
                :size,
                :instruction_pointers

    def initialize(funge_space)
      @running = true
      @funge_space = funge_space
      height = @funge_space.max_by(&:size).size
      width = @funge_space.flatten(1).max_by(&:size).size
      @size = Vector.new(width, height, @funge_space.size).freeze
      @funge_space.each do |page|
        page.each{|line| (width - line.size).times{ line << ' ' }}
        (height - page.size).times{ page << Array.new(width){ ' ' }}
      end
      @instruction_pointers = [InstructionPointer.new]
    end

    # @return [1, 2, 3] the number of dimensions of the current funge space
    def dimensions
      if three_dimensions?
        3
      elsif two_dimensions?
        2
      else
        1
      end
    end

    def two_dimensions?
      @size.y > 1
    end

    def three_dimensions?
      @size.z > 1
    end

    def run
      tick while running?
    end

    def tick
      @instruction_pointers.each do |ip|
        ip.tick(self)
      end
      @instruction_pointers.reject!(&:stopped?)
      self
    end

    def running?
      ! @instruction_pointers.empty?
    end

    def [](vec)
      @funge_space[vec.z][vec.y][vec.x]
    end

    def []=(vec, val)
      @funge_space[vec.z][vec.y][vec.x] = val
    end
  end
end