=begin
Given an array of strings, return the longest common prefix of the strings

Algorithm:
Initialize a string to hold the longest common substring
Iterate through the characters of the first string
  if all the strings in the array have that character at the same index, add it to
  the longest common substring
  if they don't, break
end
=end

def common_prefix(strs)
  longest_common_prefix = ''
  strs.first.chars.each_with_index do |char, index|
    in_all_strs = strs.all? do |other_str|
      other_str[index] == char
    end
    if in_all_strs
      longest_common_prefix << char
    else
      break
    end
  end
  longest_common_prefix
end

p common_prefix(['flower', 'flow', 'flight'])
p common_prefix(['dog', 'racecar', 'car'])
p common_prefix(['interspecies', 'interstellar', 'interstate'])
p common_prefix(['throne', 'dungeon'])
p common_prefix(['throne', 'throne'])