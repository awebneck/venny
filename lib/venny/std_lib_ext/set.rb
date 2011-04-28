class Set
  def complement(enum)
    raise ArgumentError unless enum.is_a? Enumerable
    set = enum.is_a?(Set) ? enum : Set.new(enum)
    set - self
  end

  def power_set
    pset = Set.new
    array = self.to_a
    pset.add Set.new
    array.each_index do |i|
      pset.merge(array.combination(i+1).map { |element| Set.new(element) })
    end
    pset
  end

  def cartesian_product(*enums)
  end

  def *(enum)
    cartesian_product(enum)
  end
end
