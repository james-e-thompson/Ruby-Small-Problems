items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

gather(items) do |*first_three_items, last_item|
  puts first_three_items.join(', ')
  puts last_item
end

gather(items) do |first_item, *middle_two_items, last_item|
  puts first_item
  puts middle_two_items.join(', ')
  puts last_item
end

gather(items) do |first_item, *other_items|
  puts first_item
  puts other_items.join(', ')
end

gather(items) do |first_item, second_item, third_item, fourth_item|
  puts "#{first_item}, #{second_item}, #{third_item}, and #{fourth_item}"
end