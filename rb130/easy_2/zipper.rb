def zip(arr1, arr2)
  zipped_values = []
  arr1.each_with_index do |value, index|
    zipped_values << [value, arr2[index]]
  end
  zipped_values
end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]