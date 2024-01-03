require 'pry'
=begin
Problem: Given array, determine (first)index such that sum of elements below that index equals sum of
elements above it

Algorithm:
initialize left_sum to 0, right_sum to sum of elements besides first
while index < array.size
  return index if left_sum == right_sum
  add array[index - 1] to left_sum
  subtract array[index] from right_sum
end
=end

def find_even_index(nums)
  left_sum = 0
  right_sum = nums[1..].sum
  index = 0
  loop do
    return index if left_sum == right_sum
    index += 1
    break if index >= nums.size
    left_sum += nums[index - 1]
    right_sum -= nums[index]
  end
  return -1
end

p find_even_index([1, 2, 3, 4, 3, 2, 1]) == 3
p find_even_index([1, 100, 50, -51, 1, 1]) == 1
p find_even_index([1, 2, 3, 4, 5, 6]) == -1
p find_even_index([20, 10, 30, 10, 10, 15, 35]) == 3
p find_even_index([20, 10, -80, 10, 10, 15, 35]) == 0
p find_even_index([10, -80, 10, 10, 15, 35, 20]) == 6
p find_even_index([-1, -2, -3, -4, -3, -2, -1]) == 3