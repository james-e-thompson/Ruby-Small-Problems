def egyptian(rational)
  denominators = []
  current_denominator = 0
  while rational > 0
    current_denominator = (1 / rational).ceil
    if denominators.include?(current_denominator)
      current_denominator = denominators.last + 1
    end
    rational -= Rational(1, current_denominator)
    denominators << current_denominator
  end
  denominators
end

def unegyptian(denominators)
  denominators.map { |denominator| Rational(1, denominator) }.sum
end
p egyptian(Rational(3, 1))
p unegyptian(egyptian(Rational(1, 2))) == Rational(1, 2)
p unegyptian(egyptian(Rational(3, 4))) == Rational(3, 4)
p unegyptian(egyptian(Rational(39, 20))) == Rational(39, 20)
p unegyptian(egyptian(Rational(127, 130))) == Rational(127, 130)
p unegyptian(egyptian(Rational(5, 7))) == Rational(5, 7)
p unegyptian(egyptian(Rational(1, 1))) == Rational(1, 1)
p unegyptian(egyptian(Rational(2, 1))) == Rational(2, 1)
p unegyptian(egyptian(Rational(3, 1))) == Rational(3, 1)