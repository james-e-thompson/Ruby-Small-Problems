=begin
Problem
  - Given: array of strings
  - Output: an array containing each letter that appears in all the strings, as many times as it appears
in each of them

Algorithm:
  - Initialize an array common_chars to return
  - Iterate through the unique characters in the first string in the array
    - For each of these characters, I will count how many times they appear in each string
      and take the minimum of these counts
    - Then I'll add the current character this number of times to common_chars
  - Return common_chars
=end

def common_chars(strs)
  common_chars = []
  strs.first.chars.uniq.each do |char|
    number_of_common_repeats = strs.map { |str| str.count(char) }.min
    common_chars.concat([char] * number_of_common_repeats)
  end
  common_chars
end

p common_chars(["bella", "label", "roller"]) == ["e", "l", "l"]
p common_chars(["cool", "lock", "cook"]) == ["c", "o"]
p common_chars(["hello", "goodbye", "booya", "random"]) == ["o"]
p common_chars(["aabbaaaa", "ccddddd", "eeffee", "grrrr", "yyyzzz"]) == []