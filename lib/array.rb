class Array
  def rjust!(to_size, value)
    (to_size - size).times do
      self << value
    end
    self
  end

  def rjust(i, c)
    dup.rjust!(i, c)
  end
end