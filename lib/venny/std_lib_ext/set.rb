class Set
  def complement(enum)
    raise ArgumentError, 'value must be Enumberable' unless enum.is_a? Enumerable
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
    raise ArgumentError, 'must supply at least one Enumerable argument' if enums.empty?
    enums << self
    recursive_cartesian_product(*enums)
  end

  def *(enum); cartesian_product(enum); end

  protected
    def recursive_cartesian_product(*enums)
      return Set.new([Set.new]) if enums.empty?
      raise ArgumentError, 'all arguments must be enumerable' unless enums.inject(true) { |acc, element| (acc || !element.is_a?(Enumerable)) }
      enums = enums.map { |element| element.to_a }.sort { |a, b| b.length <=> a.length }
      combos = Set.new
      enums.shift.each do |element|
        recursive_cartesian_product(*enums).each do |product|
          combos.add(product.add(element))
        end
      end
      combos
    end
end
