require 'pry'
=begin
Given a number, find the next biggest number formed by the same digits, or return -1 if
there is no such number

Iterate through the final substrings of the digits
If the new digit is greater than or equal to the first digit of the previous final substring
  Continue
Otherwise
  Return all the digits before that point plus the final digit of the number plus
  the remainder of the substring reversed
End
=end


def next_bigger_num(num)
  digits = num.to_s.chars.map(&:to_i)
  current_length = 2
  while current_length <= digits.size
    current_substring = digits[-current_length, current_length]
    if current_substring[0] < current_substring[1]
      new_first_digit = current_substring.reverse.find do |digit|
        digit > current_substring[0]
      end
      current_substring.delete(new_first_digit)
      altered_substring = [new_first_digit, current_substring[0]] \
                          + current_substring[1..].reverse
      next_bigger_digits = digits[0...-current_length] + altered_substring
      return next_bigger_digits.map(&:to_s).join.to_i
    end
    current_length += 1
  end
  return -1
end

p next_bigger_num(9)
p next_bigger_num(12)
p next_bigger_num(513)
p next_bigger_num(2017)
p next_bigger_num(111)
p next_bigger_num(531)
p next_bigger_num(897)
p next_bigger_num(123456789)

p next_bigger_num(218765) == 251678

p next_bigger_num(534976) == 536479