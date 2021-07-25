module Funge
  # A simple 3D Vector implementation.
  Vector = Struct.new(:x, :y, :z) do
    def initialize(x = 0, y = 0, z = 0)
      super
    end

    def +(other)
      binary_operation(other, :+)
    end

    def -(other)
      binary_operation(other, :-)
    end

    def /(other)
      binary_operation(other, :/)
    end

    def *(other)
      binary_operation(other, :*)
    end

    def %(other)
      binary_operation(other, :%)
    end

    # Yields every vector between this vector (inclusive) and other (inclusive). If no block is given, returns an
    # enumerator of this method.
    #
    # @param other [Vector] the vector to iterate up to, from this vector
    # @return [Vector, Enumerable] if a block is given, returns the difference between the two vectors; if no block is
    # given, returns an enumerator of this method.
    def upto(other)
      return to_enum(:upto, other) unless block_given?

      x.upto(other.x) do |delta_x|
        y.upto(other.y) do |delta_y|
          z.upto(other.z) do |delta_z|
            yield Vector.new(delta_x, delta_y, delta_z)
          end
        end
      end
      self - other
    end

    private

    def binary_operation(other, method)
      unless other.is_a?(Vector)
        other = Vector.new(other, other, other)
      end
      Vector.new(x.send(method, other.x), y.send(method, other.y), z.send(method, other.z))
    end
  end
end