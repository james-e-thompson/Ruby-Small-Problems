def max_by(arr)
  element_yielding_max = nil
  current_max = nil
  arr.each do |elem|
    if current_max == nil || yield(elem) >= current_max
      element_yielding_max = elem
      current_max = yield(elem)
    end
  end
  element_yielding_max
end

p max_by([1, 5, 3]) { |value| value + 2 } == 5
p max_by([1, 5, 3]) { |value| 9 - value } == 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by([[1, 2], [3, 4, 5], [6]]) { |value| value.size } == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } == -7
p max_by([]) { |value| value + 5 } == nil