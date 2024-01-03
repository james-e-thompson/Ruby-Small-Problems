=begin
Problem: given an array of integers, we need to return the maximum sum of all
contiguous subarrays

Algorithm:
  - Method definition: contiguous_subarrays
  - Initialize an array to contain them, add the empty array to it
  - For each index in the array
    - For each greater index less than the length of the array
      - Return the elements between them
=end

def contiguous_subarrays(arr)
  subarrays = [[]]
  (0...arr.size).to_a.each do |starting_index|
    (starting_index...arr.size).to_a.each do |ending_index|
      subarrays << arr[starting_index..ending_index]
    end
  end
  subarrays
end

def max_sequence(nums)
  contiguous_subarrays(nums).map(&:sum).max
end

p max_sequence([]) == 0
p max_sequence([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == 6
p max_sequence([11]) == 11
p max_sequence([-32]) == 0
p max_sequence([-2, 1, -7, 4, -10, 2, 1, 5, 4]) == 12