class DNA
  attr_reader :base_pairs
  def initialize(base_pairs)
    @base_pairs = base_pairs
  end

  def length
    base_pairs.length
  end

  def hamming_distance(other_base_pairs)
    number_of_differences = 0
    largest_common_index = [length, other_base_pairs.length].min - 1
    0.upto(largest_common_index) do |index|
      number_of_differences += 1 if base_pairs[index] != other_base_pairs[index]
    end
    number_of_differences
  end
end