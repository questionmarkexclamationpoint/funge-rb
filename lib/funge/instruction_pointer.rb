module Funge
  class InstructionPointer
    attr_accessor :string_mode,
                  :delta,
                  :pos,
                  :comment_mode,
                  :storage_offset,
                  :fingerprints

    attr_reader :id,
                :stack_stack

    @@current_id = -1

    def initialize(pos = Vector.new(0), delta = Direction::EAST)
      @pos = pos
      @delta = delta
      @stack_stack = [Stack.new]
      @string_mode = false
      @comment_mode = false
      @storage_offset = Vector.new
      @fingerprints = {}
      @id = @current_id += 1
    end

    def toss
      @stack_stack.last
    end

    def stack
      toss
    end

    # @param state [State]
    def curr(state)
      Instruction.parse(state[@pos])
    end

    # Determines if this instruction pointer is currently moving, that is, if its delta is non-0.
    #
    # @return [Boolean] whether or not this instruction pointer is currently moving
    def moving?
      @delta.x != 0 || @delta.y != 0 || @delta.z != 0
    end

    def stopped?
      ! moving?
    end

    # Determines if this instruction pointer is currently flying, that is, if it is moving in a non-cardinal direction.
    #
    # @return [Boolean] whether or not this instruction pointer is currently flying
    def flying?
      moving? && ! Direction::ALL.include?(@pos)
    end

    # Ticks the instruction pointer forward one step. That is, executes the current instruction the instruction pointer
    # is pointing to, and advances the pointer.
    #
    # @param state [State]
    def tick(state)
      return advance(state) if comment_mode && state[@pos] != ';'
      if string_mode && state[@pos] != '"'
        toss << state[@pos].ord
      else
        curr(state).execute(self, state)
      end
      advance(state)
    end

    # Advances the instruction pointer by as many steps as the current delta. That is, if the current delta is
    # (0, 0, 1), advances 1 step in the Z direction.
    #
    # @param state [State]
    def advance(state)
      @pos = @pos + @delta
      self
      # TODO handle wrapping
    end

    # Retreats the instruction pointer by as many steps as the current delta. That is, if the current delta is
    # (0, 0, 1), retreats 1 step in the Z direction.
    #
    # @param state [State]
    def retreat(state)
      @pos = @pos - @delta
      self
      # TODO handle wrapping
    end

    # Turns the delta on the Z-plane in the given direction.
    #
    # If direction is 0, nothing is changed.
    #
    # If direction is >0, turns right on the Z-plane.
    #
    # If direction is <0, turns left on the Z-plane.
    # @param direction [Numeric] the direction to turn the delta in
    # @return [InstructionPointer] self
    def turn(direction)
      return if direction == 0
      direction = direction <=> 0
      delta.x = direction * -delta.y
      delta.y = direction * delta.x
      self
    end
  end
end