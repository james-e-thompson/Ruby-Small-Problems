=begin
Problem: Given two strings, determine if they share a (contiguous) substring of length >= 2

Input: two strings
Output: true or false

Requirements:
  - Case doesn't matter

Algorithm
  - If two strings share a substring of length >= 2, they share one of length 2, so it suffices to check the substrings of length 2
  - Build substrings of length 2 of both strings
  - Check if the two sets overlap
=end
def length_2_substrings(str)
  length_2_substrings = []
  str.chars[...-1].each_with_index do |char, index|
    length_2_substrings << char + str[index + 1]
  end
  length_2_substrings
end

def substring_test(substring1, substring2)
  substring1 = substring1.downcase
  substring2 = substring2.downcase
  length_2_substrings(substring1).any? do |substr|
    length_2_substrings(substring2).include?(substr)
  end
end

p substring_test("Something", "Fun") == false
p substring_test("Something", "Home") == true
p substring_test("", "Something") == false
p substring_test("Something", "") == false
p substring_test("BANANA", "banana") == true
p substring_test("test", "lilt") == false
p substring_test("", "") == false
p substring_test("1234567", "541265") == true
p substring_test("supercalifragilisticexpialidocious", "SoundOfItIsAtriciou") == true