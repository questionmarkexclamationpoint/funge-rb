module Funge
  class InstructionPointer
    attr_accessor :string_mode,
                  :delta,
                  :pos,
                  :comment_mode,
                  :storage_offset

    attr_reader :id,
                :stack_stack,
                :fingerprints,
                :fingerprint_locations

    @@current_id = -1

    def initialize(pos = Vector.new(0), delta = Direction::EAST)
      @pos = pos
      @delta = delta
      @stack_stack = [Stack.new]
      @string_mode = false
      @comment_mode = false
      @storage_offset = Vector.new
      @fingerprints = []
      @fingerprint_locations = {}
      @id = @@current_id += 1
    end

    def toss
      @stack_stack.last
    end

    def soss
      @stack_stack[-2]
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
        begin
          instruction = curr(state)
          LOGGER.debug("\n" + state.funge_space[0].map(&:join).join("\n"))
          LOGGER.debug("#{id}: #{@pos}/#{state[@pos]}/#{instruction.class}/#{toss}")
          instruction.execute(self, state)
        rescue NotImplementedError => e
          Funge::LOGGER.warn("#{e.message}\n#{e.backtrace.map{|v|"\t#{v}"}.join("\n")}")
          Instruction.parse('r').execute(self, state)
        end
      end

      advance(state)
    end

    # Advances the instruction pointer by as many steps as the current delta. That is, if the current delta is
    # (0, 0, 1), advances 1 step in the Z direction.
    #
    # @param state [State]
    # @return [InstructionPointer] self
    def advance(state)
      @pos = (@pos + @delta) % state.size

      self
    end

    # Retreats the instruction pointer by as many steps as the current delta. That is, if the current delta is
    # (0, 0, 1), retreats 1 step in the Z direction.
    #
    # @param state [State]
    # @return [InstructionPointer] self
    def retreat(state)
      @pos = (@pos - @delta) % @size

      self
    end

    # Turns the delta on the Z-plane in the given direction.
    #
    # If direction is 0, nothing is changed.
    #
    # If direction is positive, turns right on the Z-plane.
    #
    # If direction is negative, turns left on the Z-plane.
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