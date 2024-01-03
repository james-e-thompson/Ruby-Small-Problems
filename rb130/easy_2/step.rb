def step(first, last, step)
  counter = first
  values = []
  while counter <= last
    values << yield(counter)
    counter += step
  end
  values
end

step(1, 10, 3) { |value| puts "value = #{value}" }