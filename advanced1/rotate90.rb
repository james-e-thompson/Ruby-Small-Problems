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

def rotate90(matrix)
  transpose(matrix).map(&:reverse)
end

matrix1 = [
  [1, 5, 8],
  [4, 7, 2],
  [3, 9, 6]
]

matrix2 = [
  [3, 7, 4, 2],
  [5, 1, 0, 8]
]

new_matrix1 = rotate90(matrix1)
new_matrix2 = rotate90(matrix2)
new_matrix3 = rotate90(rotate90(rotate90(rotate90(matrix2))))

p new_matrix1 == [[3, 4, 1], [9, 7, 5], [6, 2, 8]]
p new_matrix2 == [[5, 3], [1, 7], [0, 4], [8, 2]]
p new_matrix3 == matrix2