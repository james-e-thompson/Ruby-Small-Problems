class RomanNumeral
  attr_reader :number

  ROMAN_NUMERALS = {
    "I" => 1,
    "IV" => 4,
    "V" => 5,
    "IX" => 9,
    "X" => 10,
    "XL" => 40,
    "L" => 50,
    "XC" => 90,
    "C" => 100,
    "CD" => 400,
    "D" => 500,
    "CM" => 900,
    "M" => 1000,
}

  def initialize(number)
    @number = number
  end

  def to_roman
    roman_version = ''
    to_convert = number
    descending_numerals = ROMAN_NUMERALS.keys.sort_by do |numeral|
      ROMAN_NUMERALS[numeral]
    end
    descending_numerals.reverse!
    descending_numerals.each do |key|
      value = ROMAN_NUMERALS[key]
      multiplier, remainder = to_convert.divmod(value)
      if multiplier > 0
        roman_version += (key * multiplier)
      end
      to_convert = remainder
    end
    roman_version
  end
end