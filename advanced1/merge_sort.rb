def merge(array1, array2)
  index1 = 0
  index2 = 0
  merged_array = []
  until index1 == array1.size && index2 == array2.size
    if index1 == array1.size
      merged_array << array2[index2]
      index2 += 1
    elsif index2 == array2.size || array1[index1] < array2[index2]
      merged_array << array1[index1]
      index1 += 1
    else
      merged_array << array2[index2]
      index2 += 1
    end
  end
  merged_array
end

def merge_sort(array)
  return array if array.size <= 1
  first_half = array[0, array.size / 2]
  second_half = array[array.size / 2, array.size - array.size / 2]
  merge(merge_sort(first_half), merge_sort(second_half))
end

p merge_sort([9, 5, 7, 1]) == [1, 5, 7, 9]
p merge_sort([5, 3]) == [3, 5]
p merge_sort([6, 2, 7, 1, 4]) == [1, 2, 4, 6, 7]
p merge_sort(%w(Sue Pete Alice Tyler Rachel Kim Bonnie)) == %w(Alice Bonnie Kim Pete Rachel Sue Tyler)
p merge_sort([7, 3, 9, 15, 23, 1, 6, 51, 22, 37, 54, 43, 5, 25, 35, 18, 46]) == [1, 3, 5, 6, 7, 9, 15, 18, 22, 23, 25, 35, 37, 43, 46, 51, 54]