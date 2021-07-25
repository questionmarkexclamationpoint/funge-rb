class Array
  def rjust!(to_size, value)
    to_add = to_size - size
    to_add = 0 if to_add < 0
    if value.is_a? Array
      while to_add > 0
        unshift(*value[0..to_add])
        to_add -= value.size
      end
    else
      unshift(*Array.new(to_add, value))
    end
    self
  end

  def rjust(to_size, value)
    dup.rjust!(to_size, value)
  end

  def ljust!(to_size, value)
    to_add = to_size - size
    to_add = 0 if to_add < 0
    if value.is_a? Array
      while to_add > 0
        push(*value[0..to_add])
        to_add -= value.size
      end
    else
      push(*Array.new(to_add, value))
    end
    self
  end

  def ljust(to_size, value)
    dup.ljust(to_size, value)
  end
end