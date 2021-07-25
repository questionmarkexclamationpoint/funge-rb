module Funge
  module Instruction
    class If < Base
      CHARACTERS = ['_', '|', 'm'].freeze

      DIRECTIONS = {
          '_' => [Direction::WEST, Direction::EAST],
          '|' => [Direction::NORTH, Direction::SOUTH],
          'm' => [Direction::HIGH, Direction::LOW]
      }.freeze

      def initialize(char)
        @yes = DIRECTIONS[char].first
        @no = DIRECTIONS[char].last
      end

      def execute(ip, state)
        ip.delta = ((ip.toss.pop) != 0) ? @yes : @no
      end
    end
  end
end