def star(side_length)
  middle_row = '*' * side_length
  lower_rows = []
  outer_spacing = (side_length - 3) / 2
  inner_spacing = 0
  while outer_spacing >= 0
    line = ' ' * outer_spacing + ('*' + ' ' * inner_spacing) * 2 \
           + '*' + ' ' * outer_spacing
    lower_rows << line
    inner_spacing += 1
    outer_spacing -= 1
  end
  rows = lower_rows.reverse + [middle_row] + lower_rows
  rows.each { |row| puts row }
end

star(11)