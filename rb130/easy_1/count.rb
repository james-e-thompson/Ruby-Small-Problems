def count(arr)
  number_yielding_true = 0
  arr.each do |elem|
    number_yielding_true += 1 if yield(elem)
  end
  number_yielding_true
end

def count_alt(arr)
  return 0 if arr.empty?
  if yield(arr.first)
    1 + count_alt(arr[1..]) { |elem| yield(elem) }
  else
    count_alt(arr[1..]) { |elem| yield(elem) }
  end
end

p count([1,2,3,4,5]) { |value| value.odd? } == 3
p count([1,2,3,4,5]) { |value| value % 3 == 1 } == 2
p count([1,2,3,4,5]) { |value| true } == 5
p count([1,2,3,4,5]) { |value| false } == 0
p count([]) { |value| value.even? } == 0
p count(%w(Four score and seven)) { |value| value.size == 5 } == 2