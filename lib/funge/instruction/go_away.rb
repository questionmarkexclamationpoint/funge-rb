module Funge
  module Instruction
    class GoAway < Base
      CHARACTERS = '?'.freeze

      def execute(ip, state)
        ip.delta = to_sample(state).sample
      end

      private

      def to_sample(state)
        return Direction::THREE_DIMENSION.to_a if state.three_dimensions?
        return Direction::TWO_DIMENSION.to_a if state.two_dimensions?
        Direction::ONE_DIMENSION.to_a
      end
    end
  end
end