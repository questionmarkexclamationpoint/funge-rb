class Object
  def self.descendants
    ObjectSpace.each_object(Class).select{ |k| k < self }
  end

  def deep_dup
    Marshal.load(Marshal.dump(self))
  end
end