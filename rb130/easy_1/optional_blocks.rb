def compute(arg)
  if block_given?
    yield(arg)
  else
    "Does not compute."
  end
end

p compute(5) { |num| num + 1 } == 6
p compute("hello") == "Does not compute."
p compute("goodbye") { |str| puts str } == nil