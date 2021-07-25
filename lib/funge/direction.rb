module Funge
  module Direction
    NORTH = Vector.new(0, -1).freeze
    EAST = Vector.new(1, 0).freeze
    SOUTH = Vector.new(0, 1).freeze
    WEST = Vector.new(-1, 0).freeze
    HIGH = Vector.new(0, 0, -1).freeze
    LOW = Vector.new(0, 0, 1)

    ALL = Set[NORTH, EAST, SOUTH, WEST, HIGH, LOW].freeze
    THREE_DIMENSION = ALL
    TWO_DIMENSION = Set[NORTH, EAST, SOUTH, WEST].freeze
    ONE_DIMENSION = Set[EAST, WEST].freeze
  end
end