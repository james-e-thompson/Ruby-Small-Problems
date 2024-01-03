factorials = Enumerator.new do |y|
  current_factorial = 1
  num_to_multiply_by = 1
  loop do
    y << current_factorial
    current_factorial *= num_to_multiply_by
    num_to_multiply_by += 1
  end
end

p factorials.next
p factorials.next
p factorials.next
p factorials.next
p factorials.next
p factorials.next
p factorials.next
p factorials.next
p factorials.next
p factorials.next
factorials.rewind

factorials.each_with_index do |factorial, index|
  break if index >= 7
  p factorial
end