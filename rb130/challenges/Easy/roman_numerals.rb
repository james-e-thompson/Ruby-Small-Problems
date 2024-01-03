class RomanNumeral
  def initialize(value)
    raise ArgumentError if value > 3999
    @value = value
  end

  def convert_digit(digit, one_symbol, five_symbol, ten_symbol)
    case digit % 10
    when 0 then ''
    when (1..3)
      one_symbol * digit
     when 4
      one_symbol + five_symbol
     when (5..8)
      five_symbol + one_symbol * (digit - 5)
     when 9
      one_symbol + ten_symbol
     end
  end

  def to_roman
    one_symbols = %w(I X C M)
    five_symbols = %w(V L D)
    value_for_conversion = @value
    digit_pos = 0
    roman_numeral = ''
    while value_for_conversion != 0
      digit = value_for_conversion % 10
      symbols_to_add = convert_digit(digit, one_symbols[digit_pos],
                                     five_symbols[digit_pos],
                                     one_symbols[digit_pos + 1])
      roman_numeral = symbols_to_add + roman_numeral
      value_for_conversion /= 10
      digit_pos += 1
    end
    roman_numeral
  end
end

p RomanNumeral.new(1990).to_roman