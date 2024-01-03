class CustomSet
  def initialize(values = [])
    @elements = values.uniq
  end

  def empty?
    @elements.empty?
  end

  def contains?(value)
    @elements.include?(value)
  end

  def subset?(other_set)
    @elements.all? do |element|
      other_set.contains?(element)
    end
  end

  def disjoint?(other_set)
    @elements.each do |element|
      return false if other_set.contains?(element)
    end
    true
  end

  def eql?(other_set)
    subset?(other_set) && other_set.subset?(self)
  end

  def ==(other_set)
    eql?(other_set)
  end

  def add(element)
    @elements << element unless contains?(element)
    self
  end

  def intersection(other_set)
    CustomSet.new(@elements.select { |element| other_set.contains?(element) })
  end

  def difference(other_set)
    CustomSet.new(@elements.select { |element| !other_set.contains?(element) })
  end

  def union(other_set)
    CustomSet.new((elements + other_set.elements).uniq)
  end

  attr_reader :elements
end