module Funge
  module Instruction
    class GoDirection < Base
      CHARACTERS = ['^', '>', 'v', '<', 'h', 'l'].freeze

      DIRECTION_CHARACTERS = {
          '^' => Direction::NORTH,
          '>' => Direction::EAST,
          'v' => Direction::SOUTH,
          '<' => Direction::WEST,
          'h' => Direction::HIGH,
          'l' => Direction::LOW
      }.freeze

      def initialize(direction)
        @direction = DIRECTION_CHARACTERS[direction]
      end

      def execute(ip, state)
        ip.delta = @direction
      end
    end
  end
end