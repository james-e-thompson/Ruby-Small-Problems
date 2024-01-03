def missing(nums)
  (nums.first..nums.last).to_a - nums
end

def missing_alt(nums)
  missing_nums = []
  counter = nums.first
  nums.each do |num|
    loop do
      if counter < num
        missing_nums << counter
        counter += 1
      elsif num == counter
        counter += 1
        break
      elsif counter > num
        break
      end
    end
  end
  missing_nums
end

p missing_alt([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing_alt([1, 2, 3, 4]) == []
p missing_alt([1, 5]) == [2, 3, 4]
p missing_alt([6]) == []