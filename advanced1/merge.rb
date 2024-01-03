def merge(array1, array2)
  copy1 = array1.clone
  copy2 = array2.clone
  merged_array = []
  until copy1.empty? && copy2.empty?
    if copy1.empty?
      merged_array << copy2.shift
    elsif copy2.empty? || copy1.first < copy2.first
        merged_array << copy1.shift
    else
      merged_array << copy2.shift
    end
  end
  merged_array
end

def merge2(array1, array2)
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

p merge2([1, 5, 9], [2, 6, 8]) == [1, 2, 5, 6, 8, 9]
p merge2([1, 1, 3], [2, 2]) == [1, 1, 2, 2, 3]
p merge2([], [1, 4, 5]) == [1, 4, 5]
p merge2([1, 4, 5], []) == [1, 4, 5]