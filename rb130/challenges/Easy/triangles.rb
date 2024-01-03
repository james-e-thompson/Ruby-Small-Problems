class Triangle
  attr_reader :side_lengths

  def initialize(*given_sides)
    raise ArgumentError unless Triangle.valid?(given_sides)
    @side_lengths = given_sides
  end

  def self.valid?(given_sides)
    return false unless given_sides.size == 3 && given_sides.all? do
      |side_length| side_length > 0
    end
    given_sides.each_with_index do |side_length, index|
      other_sides = given_sides[0...index] + given_sides[(index + 1)..]
      return false unless side_length < other_sides.sum
    end
    true
  end

  def kind
    number_of_distinct_sides = side_lengths.uniq.size
    case number_of_distinct_sides
    when 1
      'equilateral'
    when 2
      'isosceles'
    when 3
      'scalene'
    end
  end
end