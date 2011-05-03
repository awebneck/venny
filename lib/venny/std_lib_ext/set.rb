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
    raise ArgumentError, 'all arguments must be enumerable' unless enums.inject(true) { |acc, element| (acc || !element.is_a?(Enumerable)) }
    enums << self
    recursive_cartesian_product(*enums)
  end

  def *(enum); cartesian_product(enum); end

  protected
    def recursive_cartesian_product(*enums)
      return Set.new([Set.new]) if enums.empty?
      combos = Set.new
      first = enums.shift
      subproducts = recursive_cartesian_product(*enums)
      first.each do |element|
        subproducts.each do |product|
          combos.add(product.clone.add(element))
        end
      end
      combos
    end
end
