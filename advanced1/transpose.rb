def transpose(matrix)
  num_rows = matrix.size
  num_columns = matrix[0].size
  transposed_matrix = []
  (0..num_columns - 1).each do |column|
    current_row = []
    (0..num_rows - 1).each do |row|
      current_row << matrix[row][column]
    end
    transposed_matrix << current_row
  end
  transposed_matrix
end
p transpose([[1, 2, 3, 4]]) == [[1], [2], [3], [4]]
p transpose([[1], [2], [3], [4]]) == [[1, 2, 3, 4]]
p transpose([[1, 2, 3, 4, 5], [4, 3, 2, 1, 0], [3, 7, 8, 6, 2]]) ==
  [[1, 4, 3], [2, 3, 7], [3, 2, 8], [4, 1, 6], [5, 0, 2]]
p transpose([[1]]) == [[1]]