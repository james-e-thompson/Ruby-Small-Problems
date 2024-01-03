=begin
Problem: given a string, determine the length of the longest palindromic substring
Input: string
Output: integer
Requirements: for the empty string, the longest palindromic substring is '' of length 0

Algorithm: one approach: get all substrings, filter by palindrome, map to lengths and take max

Initialize  array of palindromic_substrs
For each character (and index), initialize chars_before_and_after, initially 0, and current_substr, initially the character
While current substr is a palindrome, add it to palindromic_substrs, increment chars_before_and_after.
If we're out of bounds break, else assign current_substr to have one more character on each end

Now do the same thing but build the even length ones
=end

def palindrome?(str)
  str == str.reverse
end

def odd_palindromes(str, index)
  odd_palindromes = []
  chars_before_and_after = 0
  current_substring = str[index]
  while palindrome?(current_substring)
    odd_palindromes << current_substring
    chars_before_and_after += 1
    break if index - chars_before_and_after < 0 ||
             index + chars_before_and_after >= str.size
    current_substring = str[index - chars_before_and_after..
                            index + chars_before_and_after]
  end
  odd_palindromes
end

def even_palindromes(str, index)
  even_palindromes = []
  chars_before_and_after = 0
  current_substring = ''
  while palindrome?(current_substring)
    even_palindromes << current_substring unless current_substring.empty?
    chars_before_and_after += 1
    starting_index = index + 1 - chars_before_and_after
    ending_index = index + chars_before_and_after
    break if starting_index < 0 || ending_index >= str.size
    current_substring = str[starting_index..ending_index]
  end
  even_palindromes
end

def palindromic_substrings(str)
  palindromic_substrings = ['']
  str.chars.each_index do |index|
    palindromic_substrings.concat(odd_palindromes(str, index))
    palindromic_substrings.concat(even_palindromes(str, index))
  end
  palindromic_substrings
end

def longest_palindrome(str)
  palindromic_substrings(str).map(&:size).max
end

p longest_palindrome("a") == 1
p longest_palindrome("aa") == 2
p longest_palindrome("baa") == 2
p longest_palindrome("aab") == 2
p longest_palindrome("baabcd") == 4
p longest_palindrome("baablkj12345432133d") == 9