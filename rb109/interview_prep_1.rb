=begin
Problem:

Given a string, determine if it can be formed by taking a substring of itself
and repeating that substring some number of times.

Input: string, Output: boolean

Requirements:
  - Strings consist of lowercase English letters

Algorithm:

- For each initial substring of the string
  - Initialize a new variable `copies`
  - until the length of the new variable is at least the length of the original string
    - Concatenate a copy of the substring to `copies`
  - Return true if copies is the original string
- If we didn't return true, return false
=end

def initial_strings(str)
  current_initial_str = ''
  str.chars.map { |char| current_initial_str += char }
end

def repeated_substring_pattern(str)
  initial_strings(str)[0...-1].any? do |initial_string|
    copied_string = ''
    while copied_string.size < str.size
      copied_string += initial_string
    end
    copied_string == str
  end
end

p repeated_substring_pattern('abab')
p repeated_substring_pattern('aba')
p repeated_substring_pattern('aabaaba')
p repeated_substring_pattern('abaababaab')
p repeated_substring_pattern('abcabcabc')