require 'pry'
=begin
Problem: Given two strings, determine if the second is a rearrangement of a subset of the characters in the first.
Input: two strings
Output: true or false
Algorithm: Create an array of characters of str1. For each character in str2, if character is included in the array
remove it, and otherwise return false
=end
def scramble(str1, str2)
  remaining_chars = str1.chars
  str2.chars.each do |char|
    if remaining_chars.include?(char)
      remaining_chars.delete_at(remaining_chars.index(char))
    else
      return false
    end
  end
  true
end

p scramble('javass', 'jjss') == false
p scramble('rkqodlw', 'world') == true
p scramble('cedewaraaosoqqyt', 'codewars') == true
p scramble('latas', 'steak') == false
p scramble('scriptjava', 'javascript') == true
p scramble('scriptingjava', 'javascript') == true